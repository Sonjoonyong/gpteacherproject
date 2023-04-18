package com.sooaz.gpt.domain.user;

import lombok.Data;

import java.util.Date;

@Data
public class UserUpdateDto {

    private Long userId;
    private String userPassword;
    private String userNickname;
    private Date userBirthday;
}
