package com.sooaz.gpt.domain.learning.dialogue;

import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class DialogueService {

    private final LearningRepository learningRepository;
    private final SentenceRepository sentenceRepository;
    private final OpenAiClient openAiClient;

    // 초기 지시문 템플릿
    private String INITIAL_INSTRUCTION = "Let me talk to you. \n" +
            "Situation: \"%s\".\n" +
            "Place: \"%s\".\n" +
            "Optional situation: \"%s\n" +
            "My role: \"%s\". " +
            "Your role: \"%s\".  " +
            "Don't append any comment except answer. " +
            "Please don't five me the full dialogue all at once. " +
            "Say one sentence and wait for my response.";

    // 교정 요청 지시문 템플릿
    private String CORRECTION_INSTRUCTION = "This is my talk as \"%s\": \"%s\"\n\n" +
            "And this is instruction : \n" +
            "First, correct my talk in terms of grammar and clarity.\n" +
            "Second, explain for the correction.\n" +
            "\n" +
            "Give me response in JSON file like below without unnecessary comment:\n" +
            "{corrected : \"corrected version of my talk\",\n" +
            "explanation : \"explanation for correction\" }";

    // 단순 대화 지시문 템플릿. userRole, userTalk, assistantRole 순으로 String.format()
    private String USER_TALK_INSTRUCTION = "This is my talk as \"%s\": \"%s\"\n\n" +
            "Answer to my talk as \"%s\" role.\n" +
            "Do noy append unnecessary comment except your answer.";

    public String initDialogue(DialogueTopicDto dialogueTopicDto) {
        List<JSONObject> messages = new ArrayList<JSONObject>();
        messages.add(OpenAiClient.userMessage("Can you help me practice my English with a role play?"));
        messages.add(OpenAiClient.assistantMessage("Sure. I'd be happy to help you practice your English with a role play. " +
                                                            "What scenario would you like to role play?"));
        String plainTopic = getPlainTopic(dialogueTopicDto);
        messages.add(OpenAiClient.userMessage("We can practice a conversation for this scenario: \"" + plainTopic + "\""));
        messages.add(OpenAiClient.assistantMessage("Sure. We can have conversation about the scenario \"" + plainTopic + "\""));
        messages.add(OpenAiClient.userMessage("Good. Please don't give me the full dialogue all at once. Say one sentence and wait for my response."));
        messages.add(OpenAiClient.assistantMessage("Ok. Do you need any explanation or comment for my speaking?"));
        messages.add(OpenAiClient.userMessage("No. Please do not append any explanation or comment. " +
                                                    "Let's start. This is my first sentence: \"Hi\"" + dialogueTopicDto.getAssistantRole() + "\""));

        return processTalk(openAiClient.chat(messages));
    }

    public Long saveLearning(DialogueTopicDto dialogueTopicDto, Long userId) {

        // 대화 주제를 JSON으로 저장
        JSONObject topicJson = new JSONObject();
        topicJson.put("place", dialogueTopicDto.getPlace());
        topicJson.put("userRole", dialogueTopicDto.getUserRole());
        topicJson.put("assistantRole", dialogueTopicDto.getAssistantRole());
        topicJson.put("situation", dialogueTopicDto.getSituation());
        topicJson.put("option", dialogueTopicDto.getOption());

        Learning learning = new Learning();
        learning.setUserId(userId);
        learning.setLearningType(LearningType.DIALOGUE);
        learning.setLearningTopic(topicJson.toString());
        learning.setLearningDate(new Date());

        return learningRepository.save(learning).getId();
    }

    public String getPlainTopic(DialogueTopicDto dialogueTopicDto) {

        String topic = String.format(
                "As %s, you are talking to %s in case %s at %s.",
                dialogueTopicDto.getUserRole(),
                dialogueTopicDto.getAssistantRole(),
                dialogueTopicDto.getSituation(),
                dialogueTopicDto.getPlace()
        );

        String option = dialogueTopicDto.getOption();
        if (option != null && !"".equals(option)) {
            topic += String.format(
                    "\nAnd it's about \"%s\"",
                    option
            );
        }

        return topic;
    }

    private List<JSONObject> getPastMessages(Learning learning) {

        List<JSONObject> messages = new ArrayList<>();

        // 최초 지시문 추가
        String learningTopic = learning.getLearningTopic();
        JSONObject learningTopicJson;
        try {
            learningTopicJson = new JSONObject(learningTopic);
        } catch (Exception e) {
            log.error("Learning topic data from database is not parsable for JSON, \n", e);
            return null;
        }

        String initialInstruction = String.format(INITIAL_INSTRUCTION,
                learningTopicJson.getString("place"),
                learningTopicJson.getString("userRole"),
                learningTopicJson.getString("assistantRole"),
                learningTopicJson.getString("situation"),
                learningTopicJson.getString("option")
        );
        JSONObject topicMessage = OpenAiClient.userMessage(initialInstruction);
        messages.add(topicMessage);

        // 과거 대화 내역 추가
        List<Sentence> sentences = sentenceRepository.findAllByLearningId(learning.getId());
        Collections.sort(sentences, Comparator.comparing(Sentence::getId));

        for (Sentence sentence : sentences) {
            String pastAssistantTalk = sentence.getSentenceQuestion();
            String pastUserTalk = sentence.getSentenceAnswer();

            JSONObject assistantMessage = OpenAiClient.assistantMessage(pastAssistantTalk);
            JSONObject userMessage = OpenAiClient.userMessage(pastUserTalk);

            messages.add(assistantMessage);
            messages.add(userMessage);
        }

        return messages;
    }

    public String talk(String priorAssistantTalk, String userTalk, Long learningId) {

        Optional<Learning> learningOptional = learningRepository.findById(learningId);
        if (learningOptional.isEmpty()) {
            log.error("Learning optional is empty");
            return null;
        }
        Learning learning = learningOptional.get();


        // 과거 대화 내역 추출
        List<JSONObject> messages = getPastMessages(learning);

        // 교정 요청 지시문 추가
        JSONObject topicJson = new JSONObject(learning.getLearningTopic());
        String userRole = topicJson.getString("userRole");

        String correctionInstruction = String.format(CORRECTION_INSTRUCTION, userRole, userTalk);
        JSONObject correctionMessage = OpenAiClient.userMessage(correctionInstruction);
        messages.add(correctionMessage);

        String correctionStr = openAiClient.chat(messages);
        JSONObject correctionJson;
        try {
             correctionJson = new JSONObject(correctionStr);
        } catch (Exception e) {
            log.error("error: ", e);
            return "retry";
        }

        String correctedSentence = correctionJson.getString("corrected");
        String explanation = correctionJson.getString("explanation");

        // 교정 요청 지시문 삭제
        messages.remove(correctionMessage);

        // 단순 대화 지시문 추가
        String assistantRole = topicJson.getString("assistantRole");
        String userTalkInstruction = String.format(USER_TALK_INSTRUCTION, userRole, userTalk, assistantRole);
        JSONObject userMessage = OpenAiClient.userMessage(userTalkInstruction);
        messages.add(userMessage);

        // JSON 형식 응답 수신
        JSONObject resultJsonObject = new JSONObject();
        String assistantTalk = processTalk(openAiClient.chat(messages));

        try {
            // 새로운 sentence 저장
            Sentence sentence = new Sentence();
            sentence.setLearningId(learningId);
            sentence.setSentenceQuestion(assistantTalk);
            sentence.setSentenceCorrected(correctedSentence);
            sentence.setSentenceExplanation(explanation);
            sentence.setSentenceQuestion(priorAssistantTalk);
            sentence.setSentenceAnswer(userTalk);
            Long sentenceId = sentenceRepository.save(sentence).getId();

            resultJsonObject.put("answer", assistantTalk);
            resultJsonObject.put("priorAssistantTalk", priorAssistantTalk);
            resultJsonObject.put("sentenceId", sentenceId);
            resultJsonObject.put("userTalk", userTalk);
            resultJsonObject.put("correctedSentence", correctedSentence);
            resultJsonObject.put("explanation", explanation);
        } catch (Exception e) {
            log.error("e = ", e);
            return "retry";
        }

        return resultJsonObject.toString();
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

        String trimmed = talk.substring(leftIndex, rightIndex).trim();
        if (trimmed.startsWith("\"") && trimmed.endsWith("\"")) {
            trimmed = trimmed.substring(1, trimmed.length() - 1);
        }

        return trimmed;
    }
}
