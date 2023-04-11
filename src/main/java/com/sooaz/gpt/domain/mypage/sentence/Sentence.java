package com.sooaz.gpt.domain.mypage.sentence;

import lombok.Data;

import java.util.Date;

@Data
public class Sentence {
    private Long id;
    private Long learningId;
    private Long flashcardId;
    private Long voidFileId;
    private String sentenceQuestion;
    private String sentenceAnswer;
    private String sentenceCorrected;
    private Character sentenceLike;
    private String sentenceAccuracy;
    private Date sentenceNextRepetition;
    private Integer sentenceRepetitionStep;
}
