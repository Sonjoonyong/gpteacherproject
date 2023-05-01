package com.sooaz.gpt.domain.mypage.account;

import com.sooaz.gpt.domain.user.GoogleOauthClient;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import com.sooaz.gpt.domain.user.UserService;
import com.sooaz.gpt.global.constant.SessionConst;
import com.sooaz.gpt.global.security.PasswordHasher;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequiredArgsConstructor
public class WithdrawalController {

    private final PasswordHasher passwordHasher;
    private final UserService userService;
    private final GoogleOauthClient googleOauthClient;

    @GetMapping("/user/mypage/withdraw")
    public String getWithdrawForm(
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        String userLoginId = loginUser.getUserLoginId();
        if (userLoginId.length() == 36) { // OAuth 로그인 유저
            return "mypage/account/withdrawOauth";
        } else {
            return "mypage/account/withdraw";
        }
    }

    @ResponseBody
    @PostMapping("/user/mypage/withdraw")
    public String withdraw(
            @RequestParam String userPassword,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser,
            HttpServletRequest request
    ) {
        log.info("userPassword = {}", userPassword);

        if (loginUser == null) {
            return "false";
        }

        if (loginUser.getUserRole() == UserRole.ADMIN) {
            return "false";
        }

        String hashedPassword = passwordHasher.hash(
                userPassword,
                loginUser.getUserPasswordSalt()
        );

        if (loginUser.getUserPassword().equals(hashedPassword)) {
            userService.delete(loginUser.getId());
            log.info("회원 탈퇴: loginUser = {}", loginUser);
            request.getSession().invalidate();
            return "true";
        }

        return "false";
    }

    @PostMapping("/mypage/user/withdraw/oauth")
    public String withdrawOauth(
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser,
            @SessionAttribute(value = SessionConst.OAUTH_ACCESS_TOKEN, required = false) String accessToken,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    ) {
        HttpSession session = request.getSession();

        if (accessToken == null) {
            redirectAttributes.addFlashAttribute("message", "잘못된 접근입니다.");
            return "redirect:/main";
        }

        // 세션 만료 및 유저 데이터 삭제
        userService.delete(loginUser.getId());
        session.invalidate();

        // access token 만료
        googleOauthClient.revoke(accessToken);

        redirectAttributes.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다.");
        return "redirect:/main";
    }
}
