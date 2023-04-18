package com.sooaz.gpt.domain.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserService userService;

    @GetMapping("/user/login")
    public String getLoginForm() {
        return "user/login";
    }

    @PostMapping("/user/login")
    public String login(
        @Valid @ModelAttribute LoginDto loginDto,
        BindingResult bindingResult,
        @RequestParam(defaultValue = "/") String redirectUrl,
        Model model,
        HttpServletRequest request
    ) {
        User loginUser = userService.login(loginDto);

        if (loginUser == null || bindingResult.hasErrors()) {
            bindingResult.rejectValue("userLoginId", "아이디 또는 비밀번호가 잘못됐습니다.");
            model.addAttribute("bindingResult", bindingResult);
            return "user/login";
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", loginUser);
        log.info("user login: {}", loginUser);

        return "redirect:" + redirectUrl;
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

    @GetMapping("/user/new")
    public String getSignupForm() {
        return "/user/signupForm";
    }

    @PostMapping("/user/new")
    public String signUp(
            @Valid @ModelAttribute UserSignupDto userSignupDto,
            BindingResult bindingResult
    ) {
        log.info("userSignupDto = {}", userSignupDto);
        log.info("bindingResult = {}", bindingResult);

        return "home";
    }
}
