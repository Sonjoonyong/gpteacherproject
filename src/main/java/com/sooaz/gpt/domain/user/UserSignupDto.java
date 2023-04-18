package com.sooaz.gpt.domain.user;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
public class UserSignupDto {

    @NotBlank(message = "이메일을 입력해주세요.")
    @Email(message = "유효한 이메일 형식이 아닙니다.")
    private String userEmail;

    @NotBlank(message = "아이디를 입력해주세요.")
    @Pattern(regexp = "[a-zA-Z1-9]{4,12}", message = "아이디는 영문자 및 숫자 4~12자리로 입력해주세요.")
    private String userLoginId;

    @NotBlank(message = "비밀번호를 입력해주세요.")
    @Size(min = 4, max = 12, message = "4~12자 범위로 입력해주세요.")
    private String userPassword;

    @NotBlank(message = "비밀번호 확인란을 입력해주세요.")
    private String userPasswordCheck;

    @NotBlank(message = "닉네임을 입력해주세요.")
    @Size(min = 4, max = 12, message = "4~8자 범위로 입력해주세요.")
    private String userNickname;

    @NotBlank(message = "생일을 선택해주세요.")
    private String userBirthday;

    private Boolean emailSubscriptionAgreement;
}
