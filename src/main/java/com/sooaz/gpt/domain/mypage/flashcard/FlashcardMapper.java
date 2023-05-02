package com.sooaz.gpt.domain.mypage.flashcard;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FlashcardMapper {

    void save(Flashcard flashcard);

    Flashcard findByUserId(Long userId);
}