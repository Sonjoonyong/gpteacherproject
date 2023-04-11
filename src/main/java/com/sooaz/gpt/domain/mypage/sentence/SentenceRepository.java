package com.sooaz.gpt.domain.mypage.sentence;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class SentenceRepository {

    private final SentenceMapper sentenceMapper;

    public void save(Sentence sentence) {
        sentenceMapper.save(sentence);
    }

    public Optional<Sentence> findById(Long sentenceId) {
        return sentenceMapper.findById(sentenceId);
    }

    public List<Sentence> findAll() {
        return sentenceMapper.findAll();
    }

    public List<Sentence> findAllByLearningId(Long learningId) {
        return sentenceMapper.findAllByLearningId(learningId);
    }

    public void update(SentenceUpdateDto sentenceUpdateDto) {
        sentenceMapper.update(sentenceUpdateDto);
    }

    public void delete(Long sentenceId) {
        sentenceMapper.delete(sentenceId);
    }
}
