package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.constant.SessionConst;
import com.sooaz.gpt.global.email.Gmail;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserService userService;
    private final Gmail gmail;

    @GetMapping("/user/login")
    public String getLoginForm(
            Model model,
            HttpServletRequest request
    ) {
        // 일반 회원가입 유저가 Oauth 로그인 시
        Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
        if (flashMap != null && !flashMap.isEmpty()) {
            model.addAttribute("oauthLoginFail", flashMap.get("oauthLoginFail"));
        }

        model.addAttribute("loginDto", new LoginDto());
        return "user/login";
    }

    @PostMapping("/user/login")
    public String login(
            @Valid @ModelAttribute LoginDto loginDto,
            BindingResult bindingResult,
            @RequestParam(defaultValue = "/") String redirectUri,
            HttpServletRequest request
    ) {
        if (bindingResult.hasErrors()) {
            return "user/login";
        }

        User loginUser = userService.login(loginDto);
        if (loginUser == null) {
            bindingResult.reject("invalid", "아이디 또는 비밀번호가 맞지 않습니다.");
            return "user/login";
        }

        HttpSession session = request.getSession();
        session.setAttribute("loginUser", loginUser);
        log.info("user login: {}", loginUser);

        return "redirect:" + redirectUri;
    }

    @GetMapping("/user/logout")
    public String logout(
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        return "redirect:/";
    }

    @GetMapping("/user/signup")
    public String getSignupForm(Model model) {
        model.addAttribute("userSignupDto", new UserSignupDto());
        return "/user/signupForm";
    }

    @PostMapping("/user/signup")
    public String signUp(
            @Valid @ModelAttribute UserSignupDto userSignupDto,
            BindingResult bindingResult,
            HttpServletRequest request
    ) {
        String userEmail = userSignupDto.getUserEmail();
        if (userEmail != null && userService.isDuplicateEmail(userEmail)) {
            bindingResult.rejectValue("userEmail", "duplicate", "중복되는 이메일입니다.");
        }

        HttpSession session = request.getSession();
        String sessionEmail = (String) session.getAttribute(SessionConst.EMAIL);
        if (sessionEmail != null && userEmail != null && !userEmail.equals(sessionEmail)) {
            bindingResult.rejectValue("userEmail", "duplicate", "인증된 이메일과 다른 이메일입니다.");
        }

        String userEmailCode = userSignupDto.getUserEmailCode();
        if (userEmailCode != null && !isValidEmailCode(request, userEmailCode)) {
            bindingResult.rejectValue("userEmailCode", "incorrect", "이메일 인증번호가 틀렸습니다.");
        }

        String userLoginId = userSignupDto.getUserLoginId();
        if (userLoginId != null && userService.isDuplicateLoginId(userLoginId)) {
            bindingResult.rejectValue("userLoginId", "duplicate", "중복되는 아이디입니다.");
        }

        String userPasswordCheck = userSignupDto.getUserPasswordCheck();
        if (userPasswordCheck != null && !userSignupDto.getUserPassword().equals(userPasswordCheck)) {
            bindingResult.rejectValue("userPasswordCheck", "incorrect", "입력한 비밀번호와 다릅니다.");
        }


        String userNickname = userSignupDto.getUserNickname();
        if (userNickname != null && userService.isDuplicateNickname(userNickname)) {
            bindingResult.rejectValue("userNickname", "duplicate", "중복되는 닉네임입니다.");
        }

        Date userBirthday = userSignupDto.getUserBirthday();
        if (userBirthday == null) {
            bindingResult.rejectValue("userBirthday", "incorrect", "생일을 입력해주세요.");
        }

        if (bindingResult.hasErrors()) {
            return "user/signupForm";
        }

        userService.join(userSignupDto);

        return "redirect:/user/login";
    }


    @ResponseBody
    @PostMapping("/user/signup/emailCode")
    public String checkEmailCode(
            String userEmailCode,
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        String realEmailCode = (String) session.getAttribute(SessionConst.EMAIL_CODE);
        return String.valueOf(userEmailCode.equals(realEmailCode));
    }

    private boolean isValidEmailCode(HttpServletRequest request, String emailCode) {
        HttpSession session = request.getSession();
        String realEmailCode = (String) session.getAttribute(SessionConst.EMAIL_CODE);
        return realEmailCode != null && realEmailCode.equals(emailCode);
    }
}
