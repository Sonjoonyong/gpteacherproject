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
            return "user/login";
        }

        String accessToken = resultJson.getString("access_token");
        JSONObject userInfo = googleOauthClient.getUserInfo(accessToken);

        String email = userInfo.getString("email");
        String oauthName = userInfo.getString("name");
        String oauthId = userInfo.getString("sub");

        HttpSession session = request.getSession();
        Optional<User> userOpt = repository.findByEmail(email);
        if (userOpt.isPresent()) {
            // DB에 등록된 email -> 로그인 성공
            session.setAttribute(SessionConst.LOGIN_USER, userOpt.get());
            return "redirect:/";
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
            return "redirect:/";
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
        // loginId는 Oauth id로
        userSignupDto.setUserLoginId(oauthId.substring(0, Math.min(12, oauthId.length())));
        // 로그인창 비밀번호 입력은 최소 6자리이기 때문에 아래 비밀번호로 로그인할 수 없음
        userSignupDto.setUserPassword("OAUTH");
        userSignupDto.setUserNickname(userNickname);
        userSignupDto.setUserBirthday(userBirthday);
        userSignupDto.setUserEmailAgreement(userOauthSignupDto.getUserEmailAgreement());

        userService.join(userSignupDto);
        User user = repository.findByEmail(userEmail).orElse(null);
        session.setAttribute(SessionConst.LOGIN_USER, user);

        return "redirect:/";
    }
}
