package com.sooaz.gpt.domain.learning.dialogue;

import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import com.sooaz.gpt.domain.mypage.sentence.SentenceUpdateDto;
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

    private String INITIAL_INSTRUCTION = "Let's practice a role-play for \"%s\" at the \"%s\" and it's about \"%s\". " +
            "Please don't give me a full dialogue all at once and just say a single sentence and wait for my response. " +
            "My role is \"%s\", and your role is \"%s\". Start conversation with your first talk for me. " +
            "Don't append any comment except your role-play talk.";

    private String USER_TALK_INSTRUCTION = "This is my talk : \"%s\"\n" +
            "\n" +
            "First, answer to my talk.\n" +
            "Second, correct my talk.\n" +
            "Third, let me know the explanation for the correction.\n" +
            "\n" +
            "Give me response in JSON file like below :\n" +
            "{ answer : \"your answer\",\n" +
            "corrected : \"corrected version of my talk\",\n" +
            "explanation : \"explanation for correction\" }";

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

    public Sentence saveSentence(String pastAssistantTalk, String userTalk, Long learningId) {
        // 현재 유저 응답 DB에 저장
        Sentence sentence = new Sentence();
        sentence.setLearningId(learningId);
        sentence.setSentenceQuestion(pastAssistantTalk);
        sentence.setSentenceAnswer(userTalk);
        sentenceRepository.save(sentence);
        return sentence;
    }

    public String talk(String pastAssistantTalk, String userTalk, Long learningId) {
        // 새로운 sentence로 저장
        Sentence sentence = saveSentence(pastAssistantTalk, userTalk, learningId);

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

        // JSON 형식 응답 수신
        String assistantTalkJson = openAiClient.chat(messages);
        JSONObject assistantTalkJsonObject = new JSONObject(assistantTalkJson);
        String assistantTalk = assistantTalkJsonObject.getString("answer");
        String correctedSentence = assistantTalkJsonObject.getString("corrected");
        String explanation = assistantTalkJsonObject.getString("explanation");
        SentenceUpdateDto sentenceUpdateDto = new SentenceUpdateDto();

        sentenceUpdateDto.setSentenceCorrected(correctedSentence);
        sentenceUpdateDto.setSentenceExplanation(explanation);

        return "";
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
