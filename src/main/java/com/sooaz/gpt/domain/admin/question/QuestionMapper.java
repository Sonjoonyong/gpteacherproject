package com.sooaz.gpt.domain.admin.question;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuestionMapper {

    List<Question> findAll(@Param("search") String search); //게시글목록가져오기

    Question findById(Long id); //게시글정보가져오기

    void save(Question question); //게시글 작성

    void update(Question question); // 게시글 수정

    void deleteById(Long id); // 게시글 삭제
}
