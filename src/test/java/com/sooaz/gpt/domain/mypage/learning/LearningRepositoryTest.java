package com.sooaz.gpt.domain.mypage.learning;

import com.sooaz.gpt.domain.learning.LearningType;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Slf4j
@Transactional
public class LearningRepositoryTest {

    @Autowired
    LearningRepository learningRepository;

    @Test
    public void crud() {
        Learning learning = new Learning();
        learning.setUserId(1L);
        learning.setLearningTopic("sports");
        learning.setLearningType(LearningType.DIALOGUE);

        // 저장
        learningRepository.save(learning);
        log.info("learning = {}", learning);
        Learning foundLearning = learningRepository
                .findById(learning.getId())
                .orElseThrow(IllegalStateException::new);
        assertEquals(learning.getLearningTopic(), foundLearning.getLearningTopic());

        // 업데이트
        LearningUpdateDto learningUpdateDto = new LearningUpdateDto();
        learningUpdateDto.setLearningId(learning.getId());
        learningUpdateDto.setLearningLike('1');
        learningRepository.update(learningUpdateDto);
        Learning updatedLearning = learningRepository
                .findById(learning.getId())
                .orElseThrow(IllegalStateException::new);
        log.info("updatedLearning = {}", updatedLearning);
        assertEquals('1', updatedLearning.getLearningLike().charValue());

        // 삭제
        learningRepository.delete(learning.getId());
        List<Learning> learnings = learningRepository.findAll();
        assertEquals(0, learnings.size());
    }

    @Test
    public void FindAll() {
        Learning learning1 = new Learning();
        learning1.setUserId(1L);
        learning1.setLearningTopic("sports");

        Learning learning2 = new Learning();
        learning2.setUserId(2L);
        learning2.setLearningTopic("food");

        learningRepository.save(learning1);
        learningRepository.save(learning2);

        List<Learning> learnings = learningRepository.findAll();

        assertEquals(2, learnings.size());
    }

}
