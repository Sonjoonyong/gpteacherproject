package com.sooaz.gpt.domain.learning.dialogue;

import lombok.Data;

@Data
public class DialogueTopicDto {
    private String place;
    private String userRole;
    private String assistantRole;
    private String situation;
    private String option;
}