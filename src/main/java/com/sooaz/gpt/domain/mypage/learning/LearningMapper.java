package com.sooaz.gpt.domain.mypage.learning;

import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Mapper
public interface LearningMapper {

    void save(Learning learning);

    Optional<Learning> findById(Long learningId);

    List<Learning> findByUserId(LearningFindDto learningFindDto);

    List<Learning> findAll();

    int countByLearningDate(Long userId, String learningDate);

    void update(LearningUpdateDto learningUpdateDto);

    void delete(Long learningId);


}
