package com.sooaz.gpt.domain.admin.question;

import lombok.Data;
import java.util.Date;


@Data
public class Question {

    private Long id;
    private Long userId;
    private String userNickname;
    private String questionCategory;
    private String questionTitle;
    private String questionContent;
    private Integer questionHit;
    private Date questionWriteDate;
    private Boolean questionStatus;
    private String questionPassword;

    


}
