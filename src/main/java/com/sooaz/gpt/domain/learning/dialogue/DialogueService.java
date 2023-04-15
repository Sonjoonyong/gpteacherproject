package com.sooaz.gpt.domain.learning.dialogue;

import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import com.sooaz.gpt.domain.mypage.sentence.SentenceUpdateDto;
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

    // 초기 지시문 템플릿
    private String INITIAL_INSTRUCTION = "Let me talk to you. \n" +
            "Situation: \"%s\".\n" +
            "Place: \"%s\".\n" +
            "Optional situation: \"%s\n" +
            "My role: \"%s\". " +
            "Your role: \"%s\".  " +
            "Don't append any comment except your role-play talk. " +
            "Start conversation with your first talk to me with just single sentence.";

    // 유저 발화 지시문 템플릿. userRole, userTalk, assistantRole 순으로 String.format()
    private String USER_TALK_INSTRUCTION = "This is my talk as \"%s\": \"%s\"\n\n" +
            "And this is instruction : \n" +
            "First, answer to my talk as \"%s\" role.\n" +
            "Second, correct my talk in terms of grammar and clarity.\n" +
            "Third, explain for the correction.\n" +
            "\n" +
            "Give me response in JSON file like below without unnecessary comment:\n" +
            "{ answer : \"your answer. Must not be empty\",\n" +
            "corrected : \"corrected version of my talk\",\n" +
            "explanation : \"explanation for correction\" }";

    public String initDialogue(DialogueTopicDto dialogueTopicDto) {

        String initialInstruction = getInitialInstruction(dialogueTopicDto);
        return processTalk(openAiClient.chat(initialInstruction));
    }

    public Long saveLearning(DialogueTopicDto dialogueTopicDto) {

        // 대화 주제를 JSON으로 저장
        JSONObject topicJson = new JSONObject();
        topicJson.put("place", dialogueTopicDto.getPlace());
        topicJson.put("userRole", dialogueTopicDto.getUserRole());
        topicJson.put("assistantRole", dialogueTopicDto.getAssistantRole());
        topicJson.put("situation", dialogueTopicDto.getSituation());
        topicJson.put("option", dialogueTopicDto.getOption());

        Learning learning = new Learning();
        learning.setUserId(1L);
        learning.setLearningType(LearningType.DIALOGUE);
        learning.setLearningTopic(topicJson.toString());

        return learningRepository.save(learning).getId();
    }

    public String talk(String priorAssistantTalk, String userTalk, Long learningId) {
        System.out.println("DialogueService.talk");
        List<JSONObject> messages = new ArrayList<>();

        Optional<Learning> learningOptional = learningRepository.findById(learningId);
        if (learningOptional.isEmpty()) {
            log.info("error: learning optional is empty");
            return "retry";
        }
        Learning learning = learningOptional.get();

        // 최초 지시문 추가
        String learningTopic = learning.getLearningTopic();
        JSONObject learningTopicJson;
        try {
            learningTopicJson = new JSONObject(learningTopic);
        } catch (Exception e) {
            log.info("error: earning topic data from database is not parsable for JSON");
            log.info("e = {}", e);
            return "retry";
        }

        System.out.println("DialogueService.talk 22222222");
        String initialInstruction = String.format(INITIAL_INSTRUCTION,
                learningTopicJson.getString("place"),
                learningTopicJson.getString("userRole"),
                learningTopicJson.getString("assistantRole"),
                learningTopicJson.getString("situation"),
                learningTopicJson.getString("option")
        );
        JSONObject topicMessage = OpenAiClient.userMessage(initialInstruction);
        log.info("initialInstruction = {}", initialInstruction);
        messages.add(topicMessage);

        // 과거 대화 내역 추가
        List<Sentence> sentences = sentenceRepository.findAllByLearningId(learningId);
        Collections.sort(sentences, Comparator.comparing(Sentence::getId));

        for (Sentence sen : sentences) {
            String aPastAssistantTalk = sen.getSentenceQuestion();
            String pastUserTalk = sen.getSentenceAnswer();

            JSONObject assistantMessage = OpenAiClient.assistantMessage(aPastAssistantTalk);
            JSONObject userMessage = OpenAiClient.userMessage(pastUserTalk);

            messages.add(assistantMessage);
            messages.add(userMessage);
        }
        System.out.println("DialogueService.talk 3333333");


        // 지시문에 유저 답변 결합 후 추가
        JSONObject topicJson = new JSONObject(learning.getLearningTopic());
        String userRole = topicJson.getString("userRole");
        String assistantRole = topicJson.getString("assistantRole");

        String userTalkInstruction = String.format(USER_TALK_INSTRUCTION, userRole, userTalk, assistantRole);
        JSONObject userMessage = OpenAiClient.userMessage(userTalkInstruction);
        messages.add(userMessage);

        // JSON 형식 응답 수신
        JSONObject assistantTalkJsonObject;
        String assistantTalkJson = openAiClient.chat(messages);
        assistantTalkJsonObject = new JSONObject(assistantTalkJson);

        String assistantTalk;
        String correctedSentence;
        String explanation;

        try {
            assistantTalk = assistantTalkJsonObject.getString("answer");
            correctedSentence = assistantTalkJsonObject.getString("corrected");
            explanation = assistantTalkJsonObject.getString("explanation");

            // 새로운 sentence 저장
            Sentence sentence = new Sentence();
            sentence.setLearningId(learningId);
            sentence.setSentenceQuestion(assistantTalk);
            sentence.setSentenceCorrected(correctedSentence);
            sentence.setSentenceExplanation(explanation);
            sentence.setSentenceQuestion(priorAssistantTalk);
            sentence.setSentenceAnswer(userTalk);
            Long sentenceId = sentenceRepository.save(sentence).getId();

            // assistantTalk 수정 후 JSONObject에 update
            assistantTalk = processTalk(assistantTalk);
            assistantTalkJsonObject.put("answer", assistantTalk);
            assistantTalkJsonObject.put("priorAssistantTalk", priorAssistantTalk);
            assistantTalkJsonObject.put("sentenceId", sentenceId);

            assistantTalkJsonObject.put("userTalk", userTalk);
        } catch (Exception e) {
            log.info("error: result string from assistant is not parsable to JSON");
            e.printStackTrace();
            return "retry";
        }

        log.info("assistantTalkJsonObject.toString(); = {}", assistantTalkJsonObject);
        return assistantTalkJsonObject.toString();
    }

    public char updateStatus(Long sentenceId, String type) {
        char currentStatus = getStatus(sentenceId, type); // like or flashcardId의 현재 상태 구하기

        //sentenceUpdateDto 객체 생성 & 초기화
        SentenceUpdateDto sentenceUpdateDto = new SentenceUpdateDto();
        sentenceUpdateDto.setSentenceId(sentenceId);

        if (type.equals("like")) {
            if (currentStatus == '0') { //status change
                sentenceUpdateDto.setSentenceLike('1');
            } else {
                sentenceUpdateDto.setSentenceLike('0');
            }

        } else if (type.equals("storage")) {
            if (currentStatus == '0') {
                sentenceUpdateDto.setFlashcardId(1L); // TODO - 임시 flashcardId = 1
            } else {
                sentenceUpdateDto.setFlashcardId(-2L); //-2가 id로 들어오면 null로 update
            }
        }

        //sentence DB 업데이트
        sentenceRepository.update(sentenceUpdateDto);
        return getStatus(sentenceId, type);
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

    private char getStatus(Long sentenceId, String type) {
        Sentence sentence = sentenceRepository.findById(sentenceId)
                .orElseThrow(() -> {
                    throw new IllegalStateException("해당 id를 가진 sentence가 존재하지 않습니다.");
                });

        char result = ' ';

        if (type.equals("like")) {
            result = sentence.getSentenceLike(); //객체의 현재 like 반환
        } else if (type.equals("storage")) {
            Long flashcardId = sentence.getFlashcardId(); //객체의 현재 flashcardId 반환
            if (flashcardId == null) {
                result = '0';
            } else {
                result = '1';
            }
        }

        return result;
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
