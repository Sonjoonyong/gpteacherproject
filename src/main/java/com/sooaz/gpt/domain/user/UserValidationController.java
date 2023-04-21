package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.constant.SessionConst;
import com.sooaz.gpt.global.email.Gmail;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@Slf4j
@Validated
public class UserValidationController {

    private final UserService userService;
    private final Gmail gmail;

    @ResponseBody
    @GetMapping(value = "/user/signup/loginIdDupCheck")
    public String checkIdDup(
            @Pattern(regexp = "[a-zA-Z1-9]{4,12}", message = "아이디는 영문자 및 숫자 4~12자리로 입력해주세요.")
            String userLoginId
    ) {
        return String.valueOf(userService.isDuplicateLoginId(userLoginId));
    }

    @ResponseBody
    @GetMapping("/user/signup/nicknameDupCheck")
    public String checkNicknameDup(
            @Size(min = 2, max = 12, message = "2~8자 범위로 입력해주세요.")
            String userNickname
    ) {
        return String.valueOf(userService.isDuplicateNickname(userNickname));
    }

    @ResponseBody
    @GetMapping("/user/signup/emailCode")
    public String sendEmailCode(
            @Email(message = "유효한 이메일 형식이 아닙니다.")
            @NotBlank(message = "이메일을 입력해주세요.")
            String email,
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();

        if (userService.isDuplicateEmail(email)) {
            return "이미 사용중인 이메일입니다.";
        }

        String emailCode = UUID.randomUUID().toString()
                .replaceAll("-", "").substring(0, 5);
        log.info("발급된 emailCode = {}", emailCode);

        gmail.sendEmail(
                email,
                "GPTeacher 회원가입 인증코드입니다.",
                "아래 코드를 인증 창에 입력 후 회원가입을 진행하세요. \n\n" +
                        emailCode
        );

        session.setAttribute(SessionConst.EMAIL_CODE, emailCode);
        session.setAttribute(SessionConst.EMAIL, email);

        return "true";
    }

}
