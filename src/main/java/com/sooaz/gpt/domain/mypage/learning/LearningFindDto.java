package com.sooaz.gpt.domain.mypage.learning;

import com.sooaz.gpt.domain.learning.LearningType;
import lombok.Data;

@Data
public class LearningFindDto {
    private Long userId;
    private LearningType learningType;
    private String sortType;
    private Character onlyLike;
}
