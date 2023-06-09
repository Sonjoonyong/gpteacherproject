package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.constant.SessionConst;
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
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserService userService;

    @GetMapping("/user/login")
    public String getLoginForm(
            Model model,
            HttpServletRequest request
    ) {
        // 일반 회원가입 유저가 Oauth 로그인 시
        Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
        if (flashMap != null && flashMap.containsKey("oauthLoginFail")) {
            model.addAttribute("oauthLoginFail", flashMap.get("oauthLoginFail"));
        }

        model.addAttribute("loginDto", new LoginDto());
        return "user/login";
    }

    @PostMapping("/user/login")
    public String login(
            @Valid @ModelAttribute LoginDto loginDto,
            BindingResult bindingResult,
            @RequestParam(defaultValue = "/main") String redirectUri,
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
        session.setAttribute(SessionConst.LOGIN_USER, loginUser);
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

        return "redirect:/main";
    }

    @GetMapping("/user/signup")
    public String getSignupForm(Model model) {
        model.addAttribute("userSecurityQuestions", UserService.USER_SECURITY_QUESTIONS);
        model.addAttribute("userSignupDto", new UserSignupDto());
        return "/user/signupForm";
    }

    @PostMapping("/user/signup")
    public String signup(
            @Valid @ModelAttribute UserSignupDto userSignupDto,
            BindingResult bindingResult,
            Model model
    ) {
        String userEmail = userSignupDto.getUserEmail();
        if (userEmail != null && userService.isDuplicateEmail(userEmail)) {
            bindingResult.rejectValue("userEmail", "duplicate", "중복되는 이메일입니다.");
        }

        boolean isEmailValidated = userService.isEmailValidated(userEmail);
        if (!isEmailValidated) {
            bindingResult.rejectValue("userEmail", "incorrect", "인증되지 않은 이메일입니다.");
        }

        String userLoginId = userSignupDto.getUserLoginId().toLowerCase();
        if (userLoginId != null && userService.isDuplicateLoginId(userLoginId)) {
            bindingResult.rejectValue("userLoginId", "duplicate", "중복되는 아이디입니다.");
        }

        String userPasswordCheck = userSignupDto.getUserPasswordCheck();
        if (userPasswordCheck != null && !userSignupDto.getUserPassword().equals(userPasswordCheck)) {
            bindingResult.rejectValue("userPasswordCheck", "incorrect", "입력한 비밀번호와 다릅니다.");
        }

        Date userBirthday = userSignupDto.getUserBirthday();
        Date today = new Date();
        Date minDate = new Date(0, Calendar.JANUARY, 1);
        if (userBirthday == null) {
            bindingResult.rejectValue("userBirthday", "incorrect", "생일을 입력해주세요.");
        } else if (userBirthday.compareTo(today) >= 0) {
            bindingResult.rejectValue("userBirthday", "incorrect", "오늘 이전 날짜를 선택해주세요.");
        } else if (userBirthday.compareTo(minDate) < 0) {
            if (userBirthday.compareTo(minDate) < 0) {
                bindingResult.rejectValue("userBirthday", "incorrect", "1900년 이후 날짜를 선택해 주세요.");
            }
        }

        String securityQuestion = userSignupDto.getUserSecurityQuestion();
        if (Arrays.stream(UserService.USER_SECURITY_QUESTIONS)
                .noneMatch(securityQuestion::equals)
        ) {
            bindingResult.rejectValue("userSecurityQuestion", "incorrect", "주어진 질문에 대해 답변하세요.");
        }


        if (bindingResult.hasErrors()) {
            model.addAttribute("userSecurityQuestions", UserService.USER_SECURITY_QUESTIONS);
            return "user/signupForm";
        }

        userService.join(userSignupDto);
        userService.invalidEmailCode(userEmail);

        return "/user/signupSuccess";
    }

}
