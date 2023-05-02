package com.sooaz.gpt.domain.mypage.sentence;

import com.sooaz.gpt.domain.mypage.flashcard.Flashcard;
import com.sooaz.gpt.domain.mypage.flashcard.FlashcardRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class SentenceService {

    private final SentenceRepository sentenceRepository;
    private final FlashcardRepository flashcardRepository;

    public String toggleLike(Long sentenceId) {

        Optional<Sentence> sentenceOptional = sentenceRepository.findById(sentenceId);
        if (sentenceOptional.isEmpty()) {
            log.error("존재하지 않는 문장입니다.");
            return "2";
        }
        Sentence sentence = sentenceOptional.get();

        Character like = sentence.getSentenceLike();

        SentenceUpdateDto dto = new SentenceUpdateDto();
        dto.setSentenceId(sentenceId);

        if (like != null && like == '1') {
            dto.setSentenceLike('0');
            sentenceRepository.update(dto);
            return "0";
        } else {
            dto.setSentenceLike('1');
            sentenceRepository.update(dto);
            return "1";
        }
    }

    public String toggleStorage(Long userId, Long sentenceId) {

        Optional<Sentence> sentenceOptional = sentenceRepository.findById(sentenceId);
        if (sentenceOptional.isEmpty()) {
            log.error("존재하지 않는 문장입니다.");
            return "2";
        }
        Sentence sentence = sentenceOptional.get();

        Long flashcardId = sentence.getFlashcardId();

        SentenceUpdateDto dto = new SentenceUpdateDto();
        dto.setSentenceId(sentenceId);

        if (flashcardId == null || flashcardId == -2L) {
            Flashcard flashcard = flashcardRepository.findByUserId(userId);
            Long flashcardIdByUserId = flashcard.getId();
            dto.setFlashcardId(flashcardIdByUserId);
            sentenceRepository.update(dto);
            return "1";
        } else {
            dto.setFlashcardId(-2L);
            // sm-2 알고리즘 관련 컬럼 초기화
            dto.setSentenceRepetitionStep(0);
            dto.setSentenceInterval(1);
            dto.setSentenceEaseFactor(2.5);
            dto.setSentenceNextRepetition(new Date());
            sentenceRepository.update(dto);
            return "0";
        }
    }

}
