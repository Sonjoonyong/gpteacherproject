package com.sooaz.gpt.domain.learning.topic;


import com.sooaz.gpt.domain.learning.LearningType;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TopicMapper {

    void save(Topic topic);

    Topic findById(Long topicId);

    Topic findRandomOne(LearningType learningType);

    List<Topic> findAll();
}
