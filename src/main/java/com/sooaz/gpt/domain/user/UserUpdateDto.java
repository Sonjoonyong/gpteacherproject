package com.sooaz.gpt.domain.user;

import lombok.Data;

import java.util.Date;

@Data
public class UserUpdateDto {

    private Long userId;
    private UserRole userRole;
    private String userPassword;
    private String userPasswordSalt;
    private String userNickname;
    private Date userBirthday;
    private Boolean userEmailAgreement;
}
