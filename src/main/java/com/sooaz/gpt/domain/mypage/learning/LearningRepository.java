package com.sooaz.gpt.domain.mypage.learning;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class LearningRepository {

    private final LearningMapper learningMapper;

    public Learning save(Learning learning) {
        learningMapper.save(learning);
        return learning;
    }

    public Optional<Learning> findById(Long learningId) {
        return learningMapper.findById(learningId);
    }

    public List<Learning> findAll() {
        return learningMapper.findAll();
    }

    public void update() {

    }

    public void delete(Long learningId) {
        learningMapper.delete(learningId);
    }
}
