package com.sooaz.gpt.domain.admin.question;

import lombok.Data;

@Data
public class QuestionUpdateDto {
    private Long id;
    private Long userId;
    private String questionCategory;
    private String questionTitle;
    private String questionContent;
    private Integer questionHit;
    private Boolean questionStatus;
}
