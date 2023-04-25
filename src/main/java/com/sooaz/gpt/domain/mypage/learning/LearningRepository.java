package com.sooaz.gpt.domain.mypage.learning;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
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

    public List<Learning> findByUserId(LearningFindDto learningFindDto) {
        return learningMapper.findByUserId(learningFindDto);
    }

    public List<Learning> findAll() {
        return learningMapper.findAll();
    }

    public int countByLearningDate(Long userId, String learningDate) {
        return learningMapper.countByLearningDate(userId, learningDate);
    }

    public void update(LearningUpdateDto learningUpdateDto) {
        learningMapper.update(learningUpdateDto);
    }

    public void delete(Long learningId) {
        learningMapper.delete(learningId);
    }
}
