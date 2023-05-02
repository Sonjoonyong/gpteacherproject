package com.sooaz.gpt.domain.learning.topic;

import com.sooaz.gpt.domain.learning.LearningTestType;
import com.sooaz.gpt.domain.learning.LearningType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class TopicService {

    private final TopicRepository topicRepository;

    public void save(Topic topic) {
        topicRepository.save(topic);
    }

    public Topic findById(Long topicId) {
        return topicRepository.findById(topicId);
    }

    public Topic findRandomOne(LearningType learningType, LearningTestType learningTestType) {
        return topicRepository.findRandomOne(learningType, learningTestType);
    }

    public Topic findRandomOne(LearningType learningType) {
        return topicRepository.findRandomOne(learningType, null);
    }

    public List<Topic> findAll() {
        return topicRepository.findAll();
    }

}
