import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.learning.topic.Topic;
import com.sooaz.gpt.domain.learning.topic.TopicRepository;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/message-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Slf4j
//@Transactional
public class TestDataGenerator {

    @Autowired
    OpenAiClient openAiClient;

    @Autowired
    TopicRepository topicRepository;

    @Test
    public void dialogueTopic() {
        String instructionTemplate = "I wanna study English by role-playing with you. " +
                "Give me 5 random detailed role-playing settings about \"%s\". " +
                "Give me the data in JSON array(embraced by\"[]\"). " +
                "Do not append any additional comment." +
                "Each JSON have 5 properties as described below.\n" +
                "1. place\n" +
                "2. my_role\n" +
                "3. gpt_role\n" +
                "4. situation\n" +
                "5. option\n" +
                "Option means additional situation setting.";

        String[] categories = {
                "restaurant",
                "airport",
                "business trip",
                "business contract",
                "business meeting",
                "talking with family at home",
                "cooking",
                "shopping shoes",
                "shopping",
                "a romantic story",
                "i’m getting fat",
                "taking someone to place",
                "job interview",
                "carpool",
                "in subway",
                "in bus",
                "in taxi",
                "traveling",
                "making hotel reservation",
                "checking in hotel",
                "sending a package",
                "allergies",
                "missed call",
                "listening to music",
                "talking about major",
                "moving home",
                "lost and found",
                "taking pictures",
                "grocery store",
                "pharmacy",
                "drug store",
                "cancel meeting",
                "nervous about surgery",
                "go see a doctor",
                "birthday",
                "studying for exams",
                "making a doctor’s appointment",
                "sport",
                "having cold",
                "dinner invitation",
                "barbeque party",
                "meeting at company",
                "at the gym",
                "with pet",
                "driving car",
                "car accident",
                "making debate with friend",
                "asking for directions",
                "bank"
        };

        // 대주제별로 GPT로부터 소주제 5개씩 추천받기
        for (int i = 0; i < categories.length; i++) {
            String instruction = String.format(instructionTemplate, categories[i]);
            String result = openAiClient.chat(instruction, 0.5);

            if (result.startsWith("{")) {
                result = "[" + result + "]";
            }

            JSONArray jsonArray = new JSONArray(result);

            // GPT로부터 받은 응답을 DB에 저장
            for (int j = 0; j < jsonArray.length(); j++) {
                JSONObject jsonObject = jsonArray.getJSONObject(j);
                Topic topic = new Topic();
                topic.setLearningTopic(jsonObject.toString());
                topic.setLearningType(LearningType.DIALOGUE);
                topicRepository.save(topic);
            }

            List<Topic> topics = topicRepository.findAll();
            for (Topic t : topics) {
                System.out.println("t = " + t);
            }
        }
    }

    @Test
    public void test() {
        String result = "test3";

        Topic topic = new Topic();
        topic.setLearningTopic(result);
        topic.setLearningType(LearningType.DIALOGUE);

        topicRepository.save(topic);

        Topic foundTopic = topicRepository.findById(topic.getId());
        Assertions.assertEquals(topic.getLearningTopic(), foundTopic.getLearningTopic());

        for (int i = 0; i < 5; i++) {
            Topic topic1 = topicRepository.findRandomOne(LearningType.DIALOGUE);
            System.out.println("topicRepository = " + topic1.getId());
            System.out.println("topicRepository = " + topic1.getLearningTopic());
        }
    }
}
