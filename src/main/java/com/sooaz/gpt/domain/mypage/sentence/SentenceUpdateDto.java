package com.sooaz.gpt.domain.mypage.sentence;

import lombok.Data;

import java.util.Date;

@Data
public class SentenceUpdateDto {

    private Long sentenceId;
    private Long flashcardId;
    private String sentenceCorrected;
    private String sentenceExplanation;
    private Integer sentenceAccuracy;
    private Date sentenceNextRepetition;
    private Integer sentenceRepetitionStep;
    private Character sentenceLike;
}
