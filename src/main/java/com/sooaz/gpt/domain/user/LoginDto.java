package com.sooaz.gpt.domain.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
public class LoginDto {

    @NotBlank
    private String userLoginId;
    @Size(min = 6, max = 12)
    private String userPassword;
}
