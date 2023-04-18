package com.sooaz.gpt.domain.user;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Data
public class User {

    private Long id;
    private String userLoginId;
    private String userPassword;
    private String userNickname;
    private UserRole userRole;
    private String userEmail;
    private Date userBirthday;

}
