package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;

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
        String userEmail = userSignupDto.getUserEmail();
        if (userEmail != null && userService.isDuplicateEmail(userEmail)) {
            log.info("이메일 중복");
            bindingResult.rejectValue("userEmail", "duplicate","중복되는 이메일입니다.");
        }

        HttpSession session = request.getSession();
        String sessionEmail = (String) session.getAttribute(SessionConst.EMAIL);
        log.info("sessionEmail = {}", sessionEmail);
        log.info("userEmail = {}", userEmail);
        if (sessionEmail != null && userEmail!=null && !userEmail.equals(sessionEmail)) {
            log.info("인증된 이메일과 다름");
            bindingResult.rejectValue("userEmail", "duplicate","인증된 이메일과 다른 이메일입니다.");
        }

        String userLoginId = userSignupDto.getUserLoginId();
        if (userLoginId != null && userService.isDuplicateLoginId(userLoginId)) {
            log.info("아이디 중복");
            bindingResult.rejectValue("userLoginId", "duplicate","중복되는 아이디입니다.");
        }

        String userPasswordCheck = userSignupDto.getUserPasswordCheck();
        if (userPasswordCheck != null && !userSignupDto.getUserPassword().equals(userPasswordCheck)) {
            log.info("비밀번호 불일치");
            bindingResult.rejectValue("userPasswordCheck", "incorrect", "입력한 비밀번호와 다릅니다.");
        }

        String userEmailCode = userSignupDto.getUserEmailCode();
        if (userEmailCode != null && !isValidEmailCode(request, userEmailCode)) {
            log.info("이메일 인증번호 불일치");
            bindingResult.rejectValue("userEmailCode", "incorrect", "이메일 인증번호가 틀렸습니다.");
        }

        String userNickname = userSignupDto.getUserNickname();
        if (userNickname != null && userService.isDuplicateNickname(userNickname)) {
            log.info("닉네임 중복");
            bindingResult.rejectValue("userNickname", "duplicate", "중복되는 닉네임입니다.");
        }

        Date userBirthday = userSignupDto.getUserBirthday();
        if (userBirthday == null) {
            bindingResult.rejectValue("userBirthday", "incorrect", "생일을 입력해주세요.");
        }

//        try {
//            Date birthDay = new SimpleDateFormat("yyyy-MM-dd").parse(userSignupDto.getUserBirthday());
//        } catch (Exception e) {
//
//        }


        if (bindingResult.hasErrors()) {
            return "user/signupForm";
        }

        userService.join(userSignupDto);

        // 로그인 아이디 정보와 같이 로그인 창으로 이동
        LoginDto loginDto = new LoginDto();
        loginDto.setUserLoginId(userLoginId);
        model.addAttribute("loginDto", loginDto);

        return "/user/login";
    }


    @ResponseBody
    @PostMapping("/user/signup/emailCode")
    public String checkEmailCode(
            String userEmailCode,
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(60 * 10); // 이메일 인증번호 유효시간 10분
        String realEmailCode = (String) session.getAttribute(SessionConst.EMAIL_CODE);
        return String.valueOf(userEmailCode.equals(realEmailCode));
    }


    private boolean isValidEmailCode(HttpServletRequest request, String emailCode) {
        HttpSession session = request.getSession();
        String realEmailCode = (String) session.getAttribute(SessionConst.EMAIL_CODE);
        log.info("realEmailCode = {}", realEmailCode);
        log.info("emailCode = {}", emailCode);
        if (realEmailCode == null || !realEmailCode.equals(emailCode)) {
            return false;
        } else {
            return true;
        }
    }
}
