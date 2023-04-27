package com.sooaz.gpt.domain.mypage.flashcard;

import lombok.Data;

@Data
public class Flashcard {
    private Long id;
    private Long userId;
    private String flashcardName;
}
