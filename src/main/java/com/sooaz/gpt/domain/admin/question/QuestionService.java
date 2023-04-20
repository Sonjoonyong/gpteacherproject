package com.sooaz.gpt.domain.admin.question;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QuestionService {

    private final QuestionRepository questionRepository;

    public List<Question> getAllQuestions(String search){
        return questionRepository.findAll(search);
    }

    public Question getQuestionById(Long id){
        return questionRepository.findById(id).orElseThrow(()->new IllegalArgumentException("공지를 찾을 수 없습니다."));
    }

    public Question createQuesiton(QuestionCreateDto questionCreateDto){
        Question question = new Question();
        question.setUserId(questionCreateDto.getUserId());
        question.setQuestionCategory(questionCreateDto.getQuestionCategory());
        question.setQuestionTitle(questionCreateDto.getQuestionTitle());
        question.setQuestionContent(questionCreateDto.getQuestionContent());
        question.setQuestionPassword(questionCreateDto.getQuestionPassword());
        return questionRepository.save(question);
    }

    public Question updateQuestion(Long id, QuestionUpdateDto questionUpdateDto){
        Question question = getQuestionById(id);
        question.setUserId(questionUpdateDto.getUserId());
        question.setQuestionCategory(questionUpdateDto.getQuestionCategory());
        question.setQuestionTitle(questionUpdateDto.getQuestionTitle());
        question.setQuestionContent(questionUpdateDto.getQuestionContent());
        question.setQuestionHit(questionUpdateDto.getQuestionHit());
        question.setQuestionStatus(questionUpdateDto.getQuestionStatus());
        return questionRepository.save(question);
    }

    public void deleteQuestion(Long id){
        questionRepository.deleteById(id);
    }
}
