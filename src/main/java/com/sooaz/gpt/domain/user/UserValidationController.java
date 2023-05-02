package com.sooaz.gpt.domain.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Controller
@RequiredArgsConstructor
@Slf4j
@Validated
public class UserValidationController {

    private final UserService userService;

    @ResponseBody
    @GetMapping(value = "/user/signup/loginIdDupCheck")
    public String checkIdDup(
            @Pattern(regexp = "[a-zA-Z1-9]{4,12}", message = "아이디는 영문자 및 숫자 4~12자리로 입력해주세요.")
            String userLoginId
    ) {
        return String.valueOf(userService.isDuplicateLoginId(userLoginId.toLowerCase()));
    }

    @ResponseBody
    @GetMapping("/user/signup/nicknameDupCheck")
    public String checkNicknameDup(
            @Size(min = 2, max = 8, message = "2~8자 범위로 입력해주세요.")
            String userNickname
    ) {
        // (String) true: 중복, false: 사용 가능, 그 외: 오류 메시지(ExceptionHandlerAdvice 참조)
        return String.valueOf(userService.isDuplicateNickname(userNickname));
    }

    @ResponseBody
    @GetMapping("/user/signup/emailCode")
    public String sendEmailCode(
            @Email(message = "유효한 이메일 형식이 아닙니다.")
            @NotBlank(message = "이메일을 입력해주세요.")
            String userEmail
    ) {
        if (userService.isDuplicateEmail(userEmail)) {
            return "이미 사용중인 이메일입니다.";
        }

        userService.sendEmailCode(userEmail);
        return "true";
    }

    @ResponseBody
    @PostMapping("/user/signup/emailCode")
    public String checkEmailCode(
            String userEmailCode,
            String userEmail
    ) {
        boolean isValidEmailCode = userService.isValidEmailCode(userEmail, userEmailCode);
        if (isValidEmailCode) {
            userService.setEmailValidated(userEmail);
            return "true";
        } else {
            return "유효하지 않은 인증 코드입니다.";
        }
    }

}
