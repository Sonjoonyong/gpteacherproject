package com.sooaz.gpt.domain.mypage.sentence;

import com.sooaz.gpt.domain.mypage.learning.Learning;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class SentenceRepository {

    // 임시
    public Learning save(Sentence sentence) {
        return null;
    }

    // 임시
    public Optional<Learning> findById(Long sentenceId) {
        return null;
    }

    // 임시
    public List<Sentence> findAll() {
        return new ArrayList<Sentence>();
    }

    // 임시
    public List<Sentence> findAllByLearningId(Long learningId) {
        return new ArrayList<Sentence>();
    }

    // 임시
    public void update() {

    }

    // 임시
    public void delete() {

    }
}
