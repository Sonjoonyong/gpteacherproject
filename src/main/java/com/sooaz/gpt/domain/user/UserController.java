package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.constant.SessionConst;
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
    public String getLoginForm(Model model) {
        model.addAttribute("loginDto", new LoginDto());
        return "user/login";
    }

    @PostMapping("/user/login")
    public String login(
        @Valid @ModelAttribute LoginDto loginDto,
        BindingResult bindingResult,
        @RequestParam(defaultValue = "/") String redirectUrl,
        HttpServletRequest request
    ) {
        if (bindingResult.hasErrors()) {
            return "user/login";
        }

        User loginUser = userService.login(loginDto);
        if (loginUser == null) {
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

    @GetMapping("/user/signup")
    public String getSignupForm(Model model) {
        model.addAttribute("userSignupDto", new UserSignupDto());
        return "/user/signupForm";
    }

    @PostMapping("/user/signup")
    public String signUp(
            @Valid @ModelAttribute UserSignupDto userSignupDto,
            BindingResult bindingResult,
            Model model,
            HttpServletRequest request
    ) {

        if (userService.isDuplicateLoginId(userSignupDto.getUserLoginId())) {
            log.info("아이디 중복");
            bindingResult.rejectValue("userLoginId", "duplicate","중복되는 아이디입니다.");
        }

        if (!userSignupDto.getUserPassword().equals(userSignupDto.getUserPasswordCheck())) {
            log.info("비밀번호 불일치");
            bindingResult.rejectValue("userPasswordCheck", "incorrect", "입력한 비밀번호와 다릅니다.");
        }

        if (!isValidEmailCode(request, userSignupDto.getUserEmailCode())) {
            log.info("이메일 인증번호 불일치");
            bindingResult.rejectValue("userEmailCode", "incorrect", "이메일 인증번호가 틀렸습니다.");
        }

        if (userService.isDuplicateNickname(userSignupDto.getUserNickname())) {
            log.info("닉네임 중복");
            bindingResult.rejectValue("userNickname", "duplicate", "중복되는 닉네임입니다.");
        }

        if (bindingResult.hasErrors()) {
            return "user/signupForm";
        }

        log.info("userSignupDto = {}", userSignupDto);
        log.info("bindingResult = {}", bindingResult);

        LoginDto loginDto = new LoginDto();
        loginDto.setUserLoginId(userSignupDto.getUserLoginId());
        model.addAttribute("loginDto", loginDto);

        return "/user/login";
    }

    private boolean isValidEmailCode(HttpServletRequest request, String emailCode) {
        HttpSession session = request.getSession();
        String realEmailCode = (String) session.getAttribute(SessionConst.EMAIL_CODE);
        if (realEmailCode == null || !realEmailCode.equals(emailCode)) {
            return false;
        } else {
            return true;
        }
    }
}
