package com.sooaz.gpt.domain.mypage.sentence;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface SentenceMapper {

    void save(Sentence sentence);

    Optional<Sentence> findById(Long sentenceId);

    List<Sentence> findAllByLearningId(Long learningId);

    List<Sentence> findAll();

    void update(@Param("sentenceUpdateDto") SentenceUpdateDto sentenceUpdateDto);

    void delete(Long sentenceId);
}
