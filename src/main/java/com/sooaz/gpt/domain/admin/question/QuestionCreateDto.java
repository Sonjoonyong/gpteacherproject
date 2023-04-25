package com.sooaz.gpt.domain.admin.question;

import lombok.Data;

@Data
public class QuestionCreateDto {
    private Long userId;
    private String questionCategory;
    private String questionTitle;
    private String questionContent;

}
