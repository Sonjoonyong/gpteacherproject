package com.sooaz.gpt.domain.mypage.flashcard;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FlashcardMapper {

    void save(Flashcard flashcard);

    List<Flashcard> findByUserId(Long userId);

    void updateName(Flashcard flashcard);

    void delete(Long id);
}