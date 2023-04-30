package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
import java.util.Optional;
import java.util.UUID;

@Controller
@Slf4j
@RequiredArgsConstructor
public class UserOauthController {

    private final GoogleOauthClient googleOauthClient;
    private final UserRepository repository;
    private final UserService userService;


    @GetMapping("/user/login/oauth")
    public String getAuthCode(
            @RequestParam String code,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    ) {
        JSONObject resultJson = googleOauthClient.getAccessToken(code);

        if (resultJson == null) {
            log.info("토큰 발급에 실패했습니다.");
            redirectAttributes.addAttribute("oauthLoginFail", true);
            return "redirect:/user/login";
        }

        String accessToken = resultJson.getString("access_token");
        JSONObject userInfo = googleOauthClient.getUserInfo(accessToken);

        String email = userInfo.getString("email");
        String oauthName = userInfo.getString("name");
        String oauthId = userInfo.getString("sub");

        HttpSession session = request.getSession();
        session.setAttribute(SessionConst.OAUTH_ACCESS_TOKEN, accessToken);
        Optional<User> userOpt = repository.findByEmail(email);
        // DB에 등록된 email
        if (userOpt.isPresent()) {
            User user = userOpt.get();

            // 비밀번호 "OAUTH"로 자동 로그인 시도 -> Oauth 가입 계정이면 성공
            if (userService.login(user.getUserLoginId(), "OAUTH") != null) {
                session.setAttribute(SessionConst.LOGIN_USER, user);
                return "redirect:/main";
            } else { // 일반 가입 계정이면 로그인 실패
                redirectAttributes.addFlashAttribute("oauthLoginFail", true);
                return "redirect:/user/login";
            }

        } else {
            // DB에 없는 email -> email 인증처리 후 회원가입 창으로
            session.setAttribute(SessionConst.EMAIL, email);
            session.setAttribute(SessionConst.OAUTH_ID, oauthId);
            redirectAttributes.addAttribute("oauthName", oauthName);

            return "redirect:/user/signup/oauth";
        }
    }


    @GetMapping("/user/signup/oauth")
    public String getOauthSignupForm(
            @RequestParam String oauthName,
            Model model
    ) {
        UserOauthSignupDto userOauthSignupDto = new UserOauthSignupDto();
        userOauthSignupDto.setUserNickname(oauthName);
        userOauthSignupDto.setUserGeneralTermAgreement(false);
        model.addAttribute("userOauthSignupDto", userOauthSignupDto);
        return "user/oauth";
    }

    @PostMapping("/user/signup/oauth")
    public String oauthSignup(
            @Valid @ModelAttribute UserOauthSignupDto userOauthSignupDto,
            BindingResult bindingResult,
            HttpServletRequest request
    ) {

        HttpSession session = request.getSession();
        String oauthId = (String) session.getAttribute(SessionConst.OAUTH_ID);
        if (session == null || oauthId == null) {
            bindingResult.reject("access", "잘못된 접근입니다.");
            return "redirect:/main";
        }

        String userNickname = userOauthSignupDto.getUserNickname();
        if (userNickname != null && userService.isDuplicateNickname(userNickname)) {
            bindingResult.rejectValue("userNickname", "duplicate", "중복되는 닉네임입니다.");
        }

        Date userBirthday = userOauthSignupDto.getUserBirthday();
        if (userBirthday == null) {
            bindingResult.rejectValue("userBirthday", "incorrect", "생일을 입력해주세요.");
        }

        if (bindingResult.hasErrors()) {
            return "user/oauth";
        }

        UserSignupDto userSignupDto = new UserSignupDto();

        String userEmail = (String) session.getAttribute(SessionConst.EMAIL);
        userSignupDto.setUserEmail(userEmail);
        // loginId는 UUID로 지정하여 일반 로그인이 불가능하도록 함
        userSignupDto.setUserLoginId(UUID.randomUUID().toString());
        // Oauth 가입자는 비밀번호를 OAUTH로 지정, 이후 자동 로그인에 사용
        userSignupDto.setUserPassword("OAUTH");
        userSignupDto.setUserNickname(userNickname);
        userSignupDto.setUserBirthday(userBirthday);
        userSignupDto.setUserSecurityQuestion("");
        userSignupDto.setUserSecurityAnswer("");
        userSignupDto.setUserEmailAgreement(userOauthSignupDto.getUserEmailAgreement());

        userService.join(userSignupDto);
        User user = repository.findByEmail(userEmail).orElse(null);
        session.setAttribute(SessionConst.LOGIN_USER, user);

        return "redirect:/main";
    }
}
