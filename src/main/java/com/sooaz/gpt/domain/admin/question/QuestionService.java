package com.sooaz.gpt.domain.admin.question;

import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QuestionService {

    private final QuestionRepository questionRepository;
    private final UserRepository userRepository;

    public List<Question> getAllQuestions(String search){
        return questionRepository.findAll(search);
    }

    public Question getQuestionById(Long id){
        Question question = questionRepository.findById(id).get();
        User user = userRepository.findById(question.getUserId()).get();
        question.setUserNickname(user.getUserNickname());
        return question;
    }

    public Question createQuestion(QuestionCreateDto questionCreateDto){
        Question question = new Question();
        question.setUserId(questionCreateDto.getUserId());
        question.setQuestionCategory(questionCreateDto.getQuestionCategory());
        question.setQuestionTitle(questionCreateDto.getQuestionTitle());
        question.setQuestionContent(questionCreateDto.getQuestionContent());

        return questionRepository.save(question);
    }

    public Question updateQuestion(Long id, Question question){
        Question existingQuestion = getQuestionById(id);
        question.setId(id);
        question.setUserId(existingQuestion.getUserId());
        return questionRepository.save(question);
    }

    public void deleteQuestion(Long id){
        questionRepository.deleteById(id);
    }

    public Question statusUpdate(Long id, Question question){
        Question existingQuestion = getQuestionById(id);
        question.setId(id);
        question.setUserId(existingQuestion.getUserId());
        return questionRepository.statusUpdate(question);
    }


}
