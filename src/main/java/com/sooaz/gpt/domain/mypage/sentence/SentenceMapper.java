package com.sooaz.gpt.domain.mypage.sentence;

import com.sooaz.gpt.domain.mypage.learning.LearningFindDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface SentenceMapper {

    void save(Sentence sentence);

    Optional<Sentence> findById(Long sentenceId);

    List<Sentence> findAllByLearningId(Long learningId);

    List<SentenceListDto> findAllByPager(SentencePagerDto sentencePagerDto);

    List<Sentence> findByLearningId(LearningFindDto learningFindDto);

    List<Sentence> findAll();

    List<Sentence> findByFlashcardId(Long flashcardId);

    void update(SentenceUpdateDto sentenceUpdateDto);

    void delete(Long sentenceId);
}
