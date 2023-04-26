package com.sooaz.gpt.domain.admin.user;

import com.sooaz.gpt.domain.user.User;
import lombok.Data;

import java.util.Date;

@Data
public class UserView extends User {
    private Date userCreatedate;
    private Date blockDate;
}
