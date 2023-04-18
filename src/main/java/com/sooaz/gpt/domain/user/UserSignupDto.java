package com.sooaz.gpt.domain.user;

import lombok.Data;

import java.util.Date;

@Data
public class UserSignupDto {
    private String userEmail;
    private String userEmailCode;
    private String userLoginId;
    private String userPassword;
    private String userNickname;
    private Date userBirthday;
    private Character userAlarmAgreement;
}
