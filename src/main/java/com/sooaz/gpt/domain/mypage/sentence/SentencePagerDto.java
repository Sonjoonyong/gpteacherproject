package com.sooaz.gpt.domain.mypage.sentence;

import com.sooaz.gpt.domain.learning.LearningType;
import lombok.Data;

@Data
public class SentencePagerDto {

    private Long userId;
    private Long pageNum;
    private LearningType learningType;
    private Boolean liked;
    private Boolean latest;
}
