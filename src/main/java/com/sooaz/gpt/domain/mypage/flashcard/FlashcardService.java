package com.sooaz.gpt.domain.mypage.flashcard;

import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class FlashcardService {

    private final FlashcardRepository flashcardRepository;
    private final SentenceRepository sentenceRepository;

    public void insertFlashcard(Flashcard flashcard) {
        flashcardRepository.save(flashcard);
    }

    public Flashcard findByUserId(Long userId) {
        return flashcardRepository.findByUserId(userId);
    }

    public List<Sentence> getSentenceListByFlashcard(Long flashcardId) {
        return sentenceRepository.findByFlashcardId(flashcardId);
    }

}
