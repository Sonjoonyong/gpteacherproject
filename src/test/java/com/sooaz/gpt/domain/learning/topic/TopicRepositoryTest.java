package com.sooaz.gpt.domain.learning.topic;

import com.sooaz.gpt.domain.learning.LearningType;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/message-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Slf4j
@Transactional
public class TopicRepositoryTest {

    @Autowired
    TopicRepository topicRepository;

    @Test
    public void crud() {
        String result = "test3";

        Topic topic = new Topic();
        topic.setLearningTopic(result);
        topic.setLearningType(LearningType.DIALOGUE);

        topicRepository.save(topic);

        Topic foundTopic = topicRepository.findById(topic.getId());
        Assertions.assertEquals(topic.getLearningTopic(), foundTopic.getLearningTopic());

        for (int i = 0; i < 5; i++) {
            Topic topic1 = topicRepository.findRandomOne(LearningType.DIALOGUE, null);
            System.out.println("topicRepository = " + topic1.getId());
            System.out.println("topicRepository = " + topic1.getLearningTopic());
        }
    }
}