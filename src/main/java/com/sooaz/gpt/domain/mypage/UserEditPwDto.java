package com.sooaz.gpt.domain.mypage;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
public class UserEditPwDto {

    @NotBlank(message = "비밀번호를 입력해주세요.")
    private String userPassword;

    @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{6,12}$", message = "비밀번호는 6~12 자리의 영문자, 숫자 및 특수문자(@$!%*#?&)를 포함해 입력해주세요.")
    private String userNewPassword;

    private String userNewPasswordCheck;
}
