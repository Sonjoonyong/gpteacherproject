package com.sooaz.gpt.domain.learning.topic;

import com.sooaz.gpt.domain.learning.LearningType;
import lombok.Data;

@Data
public class Topic {
    private Long id;
    private LearningType learningType;
    private String learningTopic;
}
