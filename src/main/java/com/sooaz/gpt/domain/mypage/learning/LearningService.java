package com.sooaz.gpt.domain.mypage.learning;

import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class LearningService {

    private final LearningRepository learningRepository;
    private final SentenceRepository sentenceRepository;

    public String toggleLike(Long learningId) {
        Optional<Learning> learningOptional = learningRepository.findById(learningId);
        if ( learningOptional.isEmpty()) {
            log.error("존재하지 않는 학습입니다.");
            return "2";
        }
        Learning learning = learningOptional.get();

        Character like = learning.getLearningLike();

        LearningUpdateDto dto = new LearningUpdateDto();
        dto.setLearningId(learningId);

        if(like != null && like == '1') {
            dto.setLearningLike('0');
            learningRepository.update(dto);
            return "0";
        } else {
            dto.setLearningLike('1');
            learningRepository.update(dto);
            return "1";
        }
    }

    public void toggleDelete(Long learningId) {
        // sentence 삭제
        List<Sentence> sentences = sentenceRepository.findAllByLearningId(learningId);
        for (Sentence sentence : sentences) {
            sentenceRepository.delete(sentence.getId());
        }
        // learning 삭제
        learningRepository.delete(learningId);
    }
}
