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



    public static final String EXAMPLE_SCRIPT =
            "I think there's so many questions about traveling at OPIC test " +
                    "but I don't like travels that much especially the travel aboard " +
                    "so I barely remember the trouble that I had ";

    // ChatGPT에게 보여줄 JSON 예제
    public static final JSONObject EXAMPLE_SENTENCE1_JSON = new JSONObject()
            .put("original", "I think there's so many questions about traveling at OPIC test.")
            .put("corrected", "I think there are many questions about traveling on the OPIC test.")
            .put("explanation", "\"There's\" is a contraction of \"there is,\" which is singular. However, \"questions\" is plural, so \"there are\" should be used instead.");

    public static final JSONObject EXAMPLE_SENTENCE2_JSON = new JSONObject()
            .put("original", "but I don't like travels that much especially the travel aboard so I barely remember the trouble that I had.")
            .put("corrected", "However, I don't enjoy traveling that much, especially abroad, so I barely remember any trouble I may have had.")
            .put("explanation", "\"Travels\" should be changed to \"traveling\" to make it a verb. \"Aboard\" should be changed to \"abroad\" to indicate traveling to another country. The sentence structure is also improved for clarity.\"");

    public static JSONArray EXAMPLE_SENTENCE_JSON_ARRAY = new JSONArray()
            .put(EXAMPLE_SENTENCE1_JSON)
            .put(EXAMPLE_SENTENCE2_JSON);

    // ChatGPT에게 문장을 교정해달라고 요청하는 프롬프트
    public static final String SPEAKING_INSTRUCTION_PREFIX =
            "Cut my speaking script by sentence one by one followed by corrected one and explanation in JSON array. " +
                    "JSON object has three attribute. \n" +
                    "1. original: original sentence. \n" +
                    "2. corrected: corrected sentence. \n" +
                    "3. explanation: explanation for correction. \n" +
                    "Here is the script : \n";




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

    public String talk(String learningTestType, String question, String userTalk, Learning learning) {
        //TODO - learningTestType argument resolver 새성 및 등록

        // 대화 주제 추가
        learning.setUserId(1L); // temp
        learning.setLearningTopic(question);
        learning.setLearningTestType(LearningTestType.TOEIC);
        learning.setLearningType(LearningType.SPEAKING);

        learningRepository.save(learning);

        // 프롬프트 전송
        List<JSONObject> messages = new ArrayList<>();

        JSONObject userMessage = OpenAiClient.userMessage(SPEAKING_INSTRUCTION_PREFIX + EXAMPLE_SCRIPT);
        JSONObject assistantMessage = OpenAiClient.assistantMessage(EXAMPLE_SENTENCE_JSON_ARRAY.toString());
        JSONObject newUserMessage = OpenAiClient.userMessage(userTalk);

        messages.add(userMessage);
        messages.add(assistantMessage);
        messages.add(newUserMessage);

        // JSON 형식 응답 수신
        String assistantTalkJson = openAiClient.chat(messages);
        JSONObject assistantTalkJsonObject;
        JSONArray jsonArray = new JSONArray(assistantTalkJson);

        StringBuilder sb = new StringBuilder();

        try {
            for (Object object : jsonArray) {
                JSONObject jsonObject = (JSONObject) object;
                String original = jsonObject.getString("original");
                String corrected = jsonObject.getString("corrected");
                String explanation = jsonObject.getString("explanation");

                Sentence sentence = new Sentence();
                sentence.setLearningId(learning.getId());
                sentence.setSentenceQuestion(question);
                sentence.setSentenceAnswer(original);
                sentence.setSentenceCorrected(corrected);
                sentence.setSentenceExplanation(explanation);
                sentenceRepository.save(sentence);

                sb.append(corrected);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        String correctedScript = sb.toString();
        return correctedScript;
    }

    private String getInitialInstruction(SpeakingDTO speakingDTO){
        //지시문 설정
        return String.format(
                INSTRUCTION,
                speakingDTO.getTopic(),
                speakingDTO.getTopic()
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
