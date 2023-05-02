package com.sooaz.gpt.domain.learning.topic;


import com.sooaz.gpt.domain.learning.LearningTestType;
import com.sooaz.gpt.domain.learning.LearningType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TopicMapper {

    void save(Topic topic);

    Topic findById(Long topicId);

    Topic findRandomOne(@Param("learningType") LearningType learningType,
                        @Param("learningTestType") LearningTestType learningTestType);

    List<Topic> findAll();
}
