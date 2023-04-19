package com.sooaz.gpt.domain.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class LoginDto {

    @NotBlank(message = "아이디를 입력해주세요.")
    private String userLoginId;
    @NotBlank(message = "비밀번호를 입력해주세요.")
    private String userPassword;
}
