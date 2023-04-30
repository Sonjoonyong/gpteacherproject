package com.sooaz.gpt.domain.learning.topic;

import com.sooaz.gpt.domain.learning.LearningTestType;
import com.sooaz.gpt.domain.learning.LearningType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Slf4j
@RequiredArgsConstructor
public class TopicRepository {

    private final TopicMapper topicMapper;

    public void save(Topic topic) {
        topicMapper.save(topic);
    }

    public Topic findById(Long topicId) {
        return topicMapper.findById(topicId);
    }

    public Topic findRandomOne(LearningType learningType, LearningTestType learningTestType) {
        return topicMapper.findRandomOne(learningType, learningTestType);
    }

    public List<Topic> findAll() {
        return topicMapper.findAll();
    }

}
