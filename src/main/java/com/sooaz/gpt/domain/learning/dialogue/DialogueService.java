package com.sooaz.gpt.domain.learning.dialogue;

import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import lombok.RequiredArgsConstructor;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
public class DialogueService {

    private final LearningRepository learningRepository;
    private final SentenceRepository sentenceRepository;
    private final OpenAiClient openAiClient;

    private String INITIAL_INSTRUCTION = "We can practice a conversation for \"%s\" at the \"%s\" and it's about \"%s\". " +
            "Please don't give me the full dialogue all at once say one sentence " +
            "and wait for my response. I'll be a \"%s\", and you'll be a \"%s\".";

    public String initDialogue(DialogueTopicDto dialogueTopicDto) {

        String initialInstruction = getInitialInstruction(dialogueTopicDto);
        return openAiClient.chat(initialInstruction);
    }

    public Long saveLearn(DialogueTopicDto dialogueTopicDto) {

        String initialInstruction = getInitialInstruction(dialogueTopicDto);

        Learning learning = new Learning();
        learning.setLearning_type(LearningType.DIALOGUE);
        learning.setLearningTopic(initialInstruction);
        learning.setLearningDate(new Date());

        return learningRepository.save(learning).getId();
    }

    public void saveSentence(String assistantTalk, String userTalk) {
        // 현재 유저 응답 DB에 저장
        Sentence sentence = new Sentence();
        sentence.setSentenceQuestion(assistantTalk);
        sentence.setSentenceAnswer(userTalk);
        sentenceRepository.save(sentence);
    }

    public String talk(String userTalk, Long learningId) {

        List<JSONObject> messages = new ArrayList<>();

        // 대화 주제 추가
        Learning learning = learningRepository.findById(learningId)
                .orElseThrow(IllegalStateException::new);
        String learningTopic = learning.getLearningTopic();
        JSONObject topicMessage = OpenAiClient.userMessage(learningTopic);
        messages.add(topicMessage);

        // 과거 대화 내역 추가
        List<Sentence> sentences = sentenceRepository.findAllByLearningId(learningId);
        Collections.sort(sentences, Comparator.comparing(Sentence::getId));

        for (Sentence aSentence : sentences) {
            String pastAssistantTalk = aSentence.getSentenceQuestion();
            String pastUserTalk = aSentence.getSentenceAnswer();

            JSONObject assistantMessage = OpenAiClient.assistantMessage(pastAssistantTalk);
            JSONObject userMessage = OpenAiClient.userMessage(pastUserTalk);

            messages.add(assistantMessage);
            messages.add(userMessage);
        }

        JSONObject userMessage = OpenAiClient.userMessage(userTalk);
        messages.add(userMessage);

        return openAiClient.chat(messages);
    }

    private String getInitialInstruction(DialogueTopicDto dialogueTopicDto) {
        // 지시문 설정
        return String.format(
                INITIAL_INSTRUCTION,
                dialogueTopicDto.getSituation(),
                dialogueTopicDto.getPlace(),
                dialogueTopicDto.getOption(),
                dialogueTopicDto.getUserRole(),
                dialogueTopicDto.getAssistantRole()
        );
    }
}
