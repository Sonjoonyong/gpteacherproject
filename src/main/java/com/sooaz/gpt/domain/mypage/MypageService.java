package com.sooaz.gpt.domain.mypage;

import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningFindDto;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.mypage.learning.LearningUpdateDto;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.ListIterator;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class MypageService {
    private final LearningRepository learningRepository;
    private final SentenceRepository sentenceRepository;

    public List<Learning> getLearningList(LearningFindDto learningFindDto) {
        List<Learning> learnings = learningRepository.findByUserId(learningFindDto);

        ListIterator<Learning> iterator = learnings.listIterator();
        while(iterator.hasNext()) {
            Learning learning = iterator.next();
            List<Sentence> sentences = sentenceRepository.findAllByLearningId(learning.getId());

            int sentenceCount = sentences.size(); //0인 경우 -> 오류임으로 해당 learning 삭제해야할듯
            int sumAccuracy = 0;
            for (Sentence sentence : sentences) {
                Integer accuracy = sentence.getSentenceAccuracy();
                if (accuracy != null) {
                    sumAccuracy += accuracy;
                }
            }
            learning.setSentenceCount(sentenceCount);
            learning.setAverageAccuracy(Math.round(sumAccuracy/sentenceCount));
        }
        return learnings;
    }
}
