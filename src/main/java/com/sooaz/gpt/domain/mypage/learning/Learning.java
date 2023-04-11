package com.sooaz.gpt.domain.mypage.learning;

import com.sooaz.gpt.domain.learning.LearningType;
import lombok.Data;

import java.util.Date;

@Data
public class Learning {
    private Long id;
    private Long userId;
    private LearningType learningType;
    private String learningTestName;
    private String learningTopic;
    private Date learningDate;
    private Character learningLike;
}
