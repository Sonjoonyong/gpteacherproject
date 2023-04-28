package com.sooaz.gpt.domain.user;

import lombok.Data;

import java.util.Date;

@Data
public class User {

    private Long id;
    private String userLoginId;
    private String userPassword;
    private String userPasswordSalt;
    private String userNickname;
    private UserRole userRole;
    private String userEmail;
    private Date userBirthday;
    private Boolean userEmailAgreement;
    private Date blockDate;
    private String blockReason;
}
