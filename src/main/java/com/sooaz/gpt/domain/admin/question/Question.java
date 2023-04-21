package com.sooaz.gpt.domain.admin.question;

import com.sooaz.gpt.domain.user.UserRole;
import lombok.Data;
import java.util.Date;


@Data
public class Question {

    private Long id;
    private Long userId;
    //private UserRole userRole;
    private String userNickname;
    private String questionCategory;
    private String questionTitle;
    private String questionContent;
    private Integer questionHit;
    private Date questionWriteDate;
    private Boolean questionStatus;
    private String questionPassword;

    public void setQuestionWriteDate(Date questionWriteDate){
        this.questionWriteDate = questionWriteDate;
    }

}
