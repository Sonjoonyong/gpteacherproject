package com.sooaz.gpt.domain.mypage.sentence;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Slf4j
@Transactional
public class SentenceRepositoryTest {


    @Autowired
    SentenceRepository sentenceRepository;

    @Test
    public void basicCrud() {

        // 생성
        Sentence sentence = new Sentence();
        sentence.setLearningId(100L);
        sentence.setSentenceQuestion("how old are you?");
        sentence.setSentenceAnswer("I'm 29 year old");
        sentence.setSentenceCorrected("I'm 29 years old");

        sentenceRepository.save(sentence);
        log.info("sentence = {}", sentence);
        Sentence foundSentence = sentenceRepository
                .findById(sentence.getId())
                .orElseThrow(IllegalStateException::new);

        assertEquals(sentence.getSentenceAnswer(), foundSentence.getSentenceAnswer());

        // 업데이트
        SentenceUpdateDto sentenceUpdateDto = new SentenceUpdateDto();
        sentenceUpdateDto.setSentenceId(sentence.getId());
        sentenceUpdateDto.setFlashcardId(1L);
        sentenceUpdateDto.setSentenceCorrected("I'm 29 years, very old");
        sentenceUpdateDto.setSentenceAccuracy(80);
        sentenceUpdateDto.setSentenceNextRepetition(new Date());
        sentenceUpdateDto.setSentenceRepetitionStep(1);

        sentenceRepository.update(sentenceUpdateDto);

        Sentence updatedSentence = sentenceRepository
                .findById(sentence.getId())
                .orElseThrow(IllegalStateException::new);

        assertEquals(sentenceUpdateDto.getSentenceCorrected(), updatedSentence.getSentenceCorrected());

        // 삭제
        sentenceRepository.delete(sentence.getId());
        List<Sentence> sentences = sentenceRepository.findAll();
        assertEquals(0, sentences.size());
    }

    @Test
    public void findAll() {
        // given
        Sentence sentence1 = new Sentence();
        sentence1.setLearningId(100L);
        sentence1.setSentenceQuestion("how old are you?");
        sentence1.setSentenceAnswer("I'm 29 year old");
        sentence1.setSentenceCorrected("I'm 29 years old");

        Sentence sentence2 = new Sentence();
        sentence2.setLearningId(100L);
        sentence2.setSentenceQuestion("how old are you?");
        sentence2.setSentenceAnswer("I'm 29 year old");
        sentence2.setSentenceCorrected("I'm 29 years old");

        Sentence sentence3 = new Sentence();
        sentence3.setLearningId(200L);
        sentence3.setSentenceQuestion("how old are you?");
        sentence3.setSentenceAnswer("I'm 29 year old");
        sentence3.setSentenceCorrected("I'm 29 years old");

        sentenceRepository.save(sentence1);
        sentenceRepository.save(sentence2);
        sentenceRepository.save(sentence3);

        // when
        List<Sentence> sentences = sentenceRepository.findAll();
        List<Sentence> allByLearningId = sentenceRepository.findAllByLearningId(100L);

        // then
        assertEquals(3, sentences.size());
        assertEquals(2, allByLearningId.size());
    }

}