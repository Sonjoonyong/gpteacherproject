package com.sooaz.gpt.domain.learning.speaking;

import com.sooaz.gpt.domain.learning.writing.LearningTestType;
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

import java.util.ArrayList;
import java.util.List;


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

    private String INSTRUCTION = "I have to practice speaking for \"%s\" test. please give me a random question.";

    public String initSpeaking(LearningTestType learningTestType){
        String initialInstruction = getInitialInstruction(learningTestType.name());
        String question = openAiClient.chat(initialInstruction);

        return processTalk(question);
    }

    public String talk(LearningTestType learningTestType, String question, String userScript, Learning learning) {

        learning.setUserId(1L); // TODO - 로그인 구현 후 변경
        learning.setLearningTopic(question);
        learning.setLearningTestType(learningTestType);
        learning.setLearningType(LearningType.SPEAKING);

        learningRepository.save(learning);

        // 프롬프트 전송
        List<JSONObject> messages = new ArrayList<>();

        JSONObject userMessage = OpenAiClient.userMessage(SPEAKING_INSTRUCTION_PREFIX + EXAMPLE_SCRIPT);
        JSONObject assistantMessage = OpenAiClient.assistantMessage(EXAMPLE_SENTENCE_JSON_ARRAY.toString());
        JSONObject newUserMessage = OpenAiClient.userMessage(userScript);

        messages.add(userMessage);
        messages.add(assistantMessage);
        messages.add(newUserMessage);

        // JSON 형식 응답 수신
        String assistantTalkJson = openAiClient.chat(messages);
        log.info("assistantTalkJson = {}", assistantTalkJson);

        JSONArray responseJsonArray;
        try {
            responseJsonArray = new JSONArray(assistantTalkJson);
        } catch (Exception e) {
            return "retry";
        }

        StringBuilder sb = new StringBuilder();

        try {
            for (Object object : responseJsonArray) {
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
                sb.append(" ");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "retry";
        }

        return sb.toString();
    }

    private String getInitialInstruction(String learningTestType){
        //지시문 설정
        return String.format(
                INSTRUCTION,
                learningTestType
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