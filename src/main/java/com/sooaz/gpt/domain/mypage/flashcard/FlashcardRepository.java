package com.sooaz.gpt.domain.mypage.flashcard;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class FlashcardRepository {

    private final FlashcardMapper flashcardMapper;

    public void save(Flashcard flashcard) {
        flashcardMapper.save(flashcard);
    }

    public List<Flashcard> findByUserId(Long userId) {
        return flashcardMapper.findByUserId(userId);
    }

    public void updateName(Flashcard flashcard) {
        flashcardMapper.updateName(flashcard);
    }

    public void delete(Long id) {
        flashcardMapper.delete(id);
    }

}
