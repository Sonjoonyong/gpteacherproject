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

import java.io.*;
import java.util.List;

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

    @Test
    public void reverse() {
        List<Topic> topics = topicRepository.findAll();

        File file = new File("/Users/gyuray/dev/projects/gpteacherproject/sql/sample_data_topic.sql");
        try (PrintWriter pr = new PrintWriter(file)) {
            for (Topic topic : topics) {
                String learningTestType;
                if (topic.getLearningTestType() != null) {
                    learningTestType = "'" + topic.getLearningTestType() + "'";
                } else {
                    learningTestType = null;
                }
                pr.write("INSERT INTO topic (id, learning_type, learning_test_type, learning_topic) " +
                        "VALUES (TOPIC_ID_SEQ.nextval, '" + topic.getLearningType() + "', " + learningTestType + ", '" + topic.getLearningTopic().replaceAll("'", "''") + "');\n");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}