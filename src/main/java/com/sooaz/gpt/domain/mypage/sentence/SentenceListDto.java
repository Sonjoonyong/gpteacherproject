package com.sooaz.gpt.domain.mypage.sentence;

import lombok.Data;

@Data
public class SentenceListDto {

    private Long id;
    private String sentenceAnswer;
    private String sentenceCorrected;
    private String sentenceExplanation;
}
