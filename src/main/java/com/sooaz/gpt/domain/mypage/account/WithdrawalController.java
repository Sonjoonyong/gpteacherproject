package com.sooaz.gpt.domain.mypage.account;

import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import com.sooaz.gpt.domain.user.UserService;
import com.sooaz.gpt.global.constant.SessionConst;
import com.sooaz.gpt.global.security.PasswordHasher;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@Slf4j
@RequiredArgsConstructor
public class WithdrawalController {

    private final PasswordHasher passwordHasher;
    private final UserService userService;

    @GetMapping("/user/mypage/withdraw")
    public String getWithdrawForm() {
        return "mypage/account/withdraw";
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
}
