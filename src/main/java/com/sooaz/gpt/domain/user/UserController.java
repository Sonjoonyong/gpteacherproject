package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@Slf4j
@Validated
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
        if (userService.isDuplicateEmail(userSignupDto.getUserEmail())) {
            log.info("이메일 중복");
            bindingResult.rejectValue("userEmail", "duplicate","중복되는 이메일입니다.");
        }

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

    @ResponseBody
    @GetMapping(value = "/user/signup/loginIdDupCheck", produces = "text/plain; charset=utf-8")
    public String checkIdDup(
            @Pattern(regexp = "[a-zA-Z1-9]{4,12}", message = "아이디는 영문자 및 숫자 4~12자리로 입력해주세요.")
            String userLoginId
    ) {
        return String.valueOf(userService.isDuplicateLoginId(userLoginId));
    }

    @ResponseBody
    @GetMapping(value = "/user/signup/nicknameDupCheck", produces = "text/plain; charset=utf-8")
    public String checkNicknameDup(
            @Size(min = 2, max = 12, message = "2~8자 범위로 입력해주세요.")
            String userNickname
    ) {
        return String.valueOf(userService.isDuplicateNickname(userNickname));
    }

    @ResponseStatus(HttpStatus.OK)
    public void sendEmailCode(
            @Email(message = "유효한 이메일 형식이 아닙니다.")
            String email,
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        String emailCode = UUID.randomUUID().toString()
                .replaceAll("-", "").substring(0, 5);
        log.info("발급된 emailCode = {}", emailCode);
        session.setAttribute(SessionConst.EMAIL_CODE, emailCode);
    }

    @ResponseBody
    @PostMapping("/signup/emailCode")
    public String checkEmailCode(
            String emailCode,
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        String realEmailCode = (String) session.getAttribute(SessionConst.EMAIL_CODE);
        return String.valueOf(emailCode.equals(realEmailCode));
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
