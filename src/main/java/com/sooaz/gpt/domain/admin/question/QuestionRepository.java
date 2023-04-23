package com.sooaz.gpt.domain.admin.question;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class QuestionRepository {

    private final QuestionMapper questionMapper;

    public Question save(Question question){
        if(question.getId() == null) {
            questionMapper.save(question);
        } else {
            questionMapper.update(question);
        }
        return question;
    }
    public Optional<Question> findById(Long id){
        return Optional.ofNullable(questionMapper.findById(id));
    }
    public List<Question> findAll(String search){
        return questionMapper.findAll(search);
    }
    public void deleteById(Long id){
        questionMapper.deleteById(id);
    }


}
