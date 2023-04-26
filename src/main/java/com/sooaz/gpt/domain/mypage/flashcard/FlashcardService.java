package com.sooaz.gpt.domain.mypage.flashcard;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class FlashcardService {

    private final FlashcardRepository flashcardRepository;

    public void insertFlashcard(Flashcard flashcard) {
        flashcardRepository.save(flashcard);
    }

    public List<Flashcard> getFlashcardList(Long userId) {
        return flashcardRepository.findByUserId(userId);
    }

    public void updateFlashcardName(Flashcard flashcard) {
        flashcardRepository.updateName(flashcard);
    }

    public void deleteFlashcards(List<Flashcard> flashcards) {
        for(Flashcard flashcard : flashcards) {
            flashcardRepository.delete(flashcard.getId());
        }
    }

}
