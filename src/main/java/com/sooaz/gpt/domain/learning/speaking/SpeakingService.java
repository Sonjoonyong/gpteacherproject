package com.sooaz.gpt.domain.learning.speaking;

import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.learning.dialogue.DialogueTopicDto;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.*;
import java.util.regex.Pattern;


@Service
@RequiredArgsConstructor
@Slf4j
public class SpeakingService {
    private final OpenAiClient openAiClient;
    private final LearningRepository learningRepository;
    private final SentenceRepository sentenceRepository;

    private String INSTRUCTION = "i have to practice speaking for \"%s\" test. please give me one question (sentences related to the \"%s\" test).";

    private String USER_TALK_INSTRUCTION = "this is my sentence : \"%s\"\n\n" +
            "First, make correct my sentence, focusing on grammer, structure and punctuation.\n"+
            "Second, let me know the explanation for the correction.\n"+
            "give me response in JSON file like below :\n"+
            "{sentence : \"my sentence\", \n" +
            "corrected : \"corrected version of my sentence\",\n" +
            "explanation : \"explanation for my correction\"}";

    public String initSpeaking(SpeakingDTO speakingDTO){
        String initialInstruction = getInitialInstruction(speakingDTO);
        String question = openAiClient.chat(initialInstruction);
        return processTalk(question);
    }

    public Long saveLearn(SpeakingDTO speakingDTO) {
        String initialInstruction = getInitialInstruction(speakingDTO);
        Learning learning = new Learning();
        learning.setUserId(1L);
        learning.setLearningType(LearningType.SPEAKING);
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
        JSONObject assistantTalkJsonObject;
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
            sentenceRepository.save(sentence);
            /*
            // assistantTalk 수정 후 JSONObject에 update
            assistantTalk = processTalk(assistantTalk);
            assistantTalkJsonObject.remove("answer");
            assistantTalkJsonObject.put("answer", assistantTalk);
            assistantTalkJsonObject.put("priorAssistantTalk", priorAssistantTalk);
            assistantTalkJsonObject.put("userTalk", userTalk);
            */
        } catch (Exception e) {
            e.printStackTrace();
            assistantTalkJsonObject.put("result", "fail");
        }

        return assistantTalkJsonObject;
    }

    private String getInitialInstruction(SpeakingDTO speakingDTO){
        //지시문 설정
        return String.format(
                INSTRUCTION,
                speakingDTO.getTOPIC(),
                speakingDTO.getTOPIC()
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

























    // 사용자 답변 평가
    public String evaluateAnswer(String userAnswer, String question) throws IOException {
        StringBuilder responseBuilder = new StringBuilder();

        // 문장 분할에 정규식 패턴 사용
        Pattern sentencePattern = Pattern.compile("(?<!\\b(?:[Dd]r|[Mm]r|[Mm]rs|[Mm]s|[Pp]rof|[Ss]t))\\b[.!?]\\s+(?=[A-Z])");
        List<String> sentences = Arrays.asList(sentencePattern.split(userAnswer));

        // 각 문장을 간결하고 문장이 흐트러지지 않게 교정 요청
        for (String sentence : sentences) {
            //String prompt = "chatGPT, there are rules to follow when correcting English sentences. If you want me to correct an English sentence, please provide it and specify that you only want the portion of the sentence after 'answer:' to be corrected. If there is no issues, you must output the portion of the sentence after 'answer:' as requested. answer:"+sentence;
            //"Please provide a concise correction for the following sentence, focusing on grammar, structure, and punctuation, without changing the user's original content or intention, even if it may be factually incorrect. Ensure that commas are not changed to periods: " + sentence;
            String prompt = "this is my sentence : \n" +sentence+
                    "First, make correct my sentence, focusing on grammer, structure and punctuation.\n"+
                    "Second, let me know the explanation for the correction.\n"+
                    "give me response in JSON file like below :\n"+
                    "{sentence : \"my sentence\", \n" +
                    "corrected : \"corrected version of my sentence\",\n" +
                    "explanation : \"explanation for my correction\"}";

            String response = openAiClient.chat(prompt);

            if (responseBuilder.length() > 0) {
                responseBuilder.append(" ");
            }
            responseBuilder.append(response.trim());
        }
        return responseBuilder.toString();
    }

    // 원본 답변과 수정된 답변의 분석 데이터를 가져옴
    public JSONArray getAnalysisData(String originalAnswer, String correctedAnswer) throws IOException {
        JSONArray analysis = new JSONArray();

        // 문장 분할에 정규식 패턴 사용
        Pattern sentencePattern = Pattern.compile("(?<!\\b(?:[Dd]r|[Mm]r|[Mm]rs|[Mm]s|[Pp]rof|[Ss]t))\\b[.!?]\\s+(?=[A-Z])");
        List<String> originalSentences = Arrays.asList(sentencePattern.split(originalAnswer));
        List<String> correctedSentences = Arrays.asList(sentencePattern.split(correctedAnswer));

        int minLength = Math.min(originalSentences.size(), correctedSentences.size());

        // 각 문장과 해당 수정된 문장을 비교
        for (int i = 0; i < minLength; i++) {
            String original = originalSentences.get(i).trim();
            String corrected = correctedSentences.get(i).trim();

            // 원문과 정정된 문장이 동일하지 않을 경우 교정 이유에 대한 설명을 받음
            String explanation = null;
            if (!original.equals(corrected)) {
                explanation = getCorrectionExplanation(original, corrected).trim();
            }

            // 각 문장 비교에 대한 JSON 객체를 생성하여 분석에 추가
            JSONObject item = new JSONObject();
            item.put("original", original);
            item.put("corrected", corrected);
            item.put("explanation", explanation);

            analysis.put(item);
        }

        return analysis;
    }

    // 원문과 교정된 문장의 차이에 대한 간결한 설명 구하기
    public String getCorrectionExplanation(String original, String corrected) {
        String prompt = String.format("Explain the difference between the original sentence and the corrected sentence in a concise manner:\n\nOriginal: %s\nCorrected: %s", original, corrected);
        return openAiClient.chat(prompt);
    }

}
