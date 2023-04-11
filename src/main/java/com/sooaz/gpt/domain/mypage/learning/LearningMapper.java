package com.sooaz.gpt.domain.mypage.learning;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface LearningMapper {

    void save(Learning learning);

    Optional<Learning> findById(Long learningId);

    List<Learning> findAll();

    void delete(Long learningId);


}
