package com.sooaz.gpt.domain.mypage.learning;

import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.learning.speaking.LearningTestType;
import lombok.Data;

import java.util.Date;

@Data
public class Learning {
    private Long id;
    private Long userId;
    private LearningType learningType;
    private LearningTestType learningTestType;
    private String learningTopic;
    private Date learningDate;
    private Character learningLike;
}
