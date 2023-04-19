package com.sooaz.gpt.domain.mypage.sentence;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class SentenceService {

    private final SentenceRepository sentenceRepository;

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

    public String toggleStorage(Long sentenceId) {

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
            dto.setFlashcardId(1L);
            sentenceRepository.update(dto);
            return "1";
        } else {
            dto.setFlashcardId(-2L);
            sentenceRepository.update(dto);
            return "0";
        }
    }

}
