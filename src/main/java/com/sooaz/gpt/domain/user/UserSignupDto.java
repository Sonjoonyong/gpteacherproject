package com.sooaz.gpt.domain.user;

import lombok.Data;

import javax.validation.constraints.*;

@Data
public class UserSignupDto {

    @Email(message = "유효한 이메일 형식이 아닙니다.")
    private String userEmail;

    @NotBlank(message = "인증 코드를 입력해주세요.")
    private String userEmailCode;

    @Pattern(regexp = "[a-zA-Z1-9]{4,12}", message = "아이디는 영문자 및 숫자 4~12자리로 입력해주세요.")
    private String userLoginId;

    @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{4,12}$", message = "비밀번호는 4~12자리의 영문자, 숫자 및 특수문자($@$!%*#?&)를 포함해 입력해주세요.")
    private String userPassword;

    @NotBlank(message = "비밀번호 확인란을 입력해주세요.")
    private String userPasswordCheck;

    @Size(min = 4, max = 12, message = "4~8자 범위로 입력해주세요.")
    private String userNickname;

    @NotBlank(message = "생년월일을 입력해주세요.")
    private String userBirthday;

    private Boolean allTermAgreement;

    @AssertTrue(message = "필수 약관에 동의해주세요.")
    private Boolean generalTermAgreement;

    @AssertTrue(message = "필수 약관에 동의해주세요.")
    private Boolean privacyTermAgreement;
    private Boolean emailSubscriptionAgreement;
}
