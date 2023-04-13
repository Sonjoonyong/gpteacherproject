package com.sooaz.gpt.domain.learning.dialogue;

import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class DialogueService {

    private final LearningRepository learningRepository;
    private final SentenceRepository sentenceRepository;
    private final OpenAiClient openAiClient;

    private String INITIAL_INSTRUCTION = "Let's have conversation with me about \"%s\" at the \"%s\" and it's about \"%s\". " +
            "My role is \"%s\", and your role is \"%s\".  " +
            "Please don't give me a full dialogue all at once. " +
            "Just response only a single sentence and wait for my talk. " +
            "Don't append any comment except your role-play talk. " +
            "Start conversation with your first talk to me with just single sentence.";

    private String USER_TALK_INSTRUCTION = "This is my talk : \"%s\"\n" +
            "\n" +
            "First, correct my talk.\n" +
            "Second, answer to my role-play talk.\n" +
            "Third, let me know the explanation for the correction.\n" +
            "\n" +
            "Give me response in JSON file like below :\n" +
            "{ answer : \"your answer\",\n" +
            "corrected : \"corrected version of my talk\",\n" +
            "explanation : \"explanation for correction\" }";

    public String initDialogue(DialogueTopicDto dialogueTopicDto) {

        String initialInstruction = getInitialInstruction(dialogueTopicDto);
        return processTalk(openAiClient.chat(initialInstruction));
    }

    public Long saveLearn(DialogueTopicDto dialogueTopicDto) {

        String initialInstruction = getInitialInstruction(dialogueTopicDto);

        Learning learning = new Learning();
        learning.setUserId(1L);
        learning.setLearningType(LearningType.DIALOGUE);
        learning.setLearningTopic(initialInstruction);

        return learningRepository.save(learning).getId();
    }

    public JSONObject talk(String priorAssistantTalk, String userTalk, Long learningId) {

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
            String aPastAssistantTalk = aSentence.getSentenceQuestion();
            String pastUserTalk = aSentence.getSentenceAnswer();

            JSONObject assistantMessage = OpenAiClient.assistantMessage(aPastAssistantTalk);
            JSONObject userMessage = OpenAiClient.userMessage(pastUserTalk);

            messages.add(assistantMessage);
            messages.add(userMessage);
        }

        // 지시문에 유저 답변 결합 후 추가
        String userTalkInstruction = String.format(USER_TALK_INSTRUCTION, userTalk);
        JSONObject userMessage = OpenAiClient.userMessage(userTalkInstruction);
        messages.add(userMessage);

        log.info("===============================learning id = {}============================", learningId);
        log.info("======================================================================");
        for (JSONObject message : messages) {
            log.info("message = {}", message);
        }
        log.info("======================================================================");
        log.info("======================================================================");

        // JSON 형식 응답 수신
        String assistantTalkJson = openAiClient.chat(messages);
        JSONObject assistantTalkJsonObject = new JSONObject(assistantTalkJson);
        String assistantTalk = assistantTalkJsonObject.getString("answer");
        String correctedSentence = assistantTalkJsonObject.getString("corrected");
        String explanation = assistantTalkJsonObject.getString("explanation");

        // 새로운 sentence 저장
        Sentence sentence = new Sentence();
        sentence.setLearningId(learningId);
        sentence.setSentenceQuestion(assistantTalk);
        sentence.setSentenceCorrected(correctedSentence);
        sentence.setSentenceExplanation(explanation);
        sentence.setSentenceQuestion(priorAssistantTalk);
        sentence.setSentenceAnswer(userTalk);
        sentenceRepository.save(sentence);

        // assistantTalk 수정 후 JSONObject에 update
        assistantTalk = processTalk(assistantTalk);
        assistantTalkJsonObject.remove("answer");
        assistantTalkJsonObject.put("answer", assistantTalk);
        assistantTalkJsonObject.put("priorAssistantTalk", priorAssistantTalk);
        return assistantTalkJsonObject;
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

    private String processTalk(String talk) {
        if (talk == null || talk.length() == 0) {
            return "";
        }

        int colon = talk.indexOf(':');
        int leftParenthesis = talk.indexOf('(');

        int leftIndex = (colon == -1) ? 0 : colon + 1;
        int rightIndex = (leftParenthesis == -1) ? talk.length() : leftParenthesis;

        return talk.substring(leftIndex, rightIndex).trim();
    }
}
