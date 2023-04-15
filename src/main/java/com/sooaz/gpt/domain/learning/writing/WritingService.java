package com.sooaz.gpt.domain.learning.writing;

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
public class WritingService {

    private final OpenAiClient openAiClient;
    private final LearningRepository learningRepository;
    private final SentenceRepository sentenceRepository;

    public static final String EXAMPLE_SCRIPT =
            "I think the English writing is a very difficult. " +
                    "but it could be my personal opinion. " +
                    "so I think about it again today. ";

    // 챗 GPT에게 보여줄 JSON 예제
    public static final JSONObject EXAMPLE_SENTENCE1_JSON = new JSONObject()
            .put("original", "I think the English writing is a very difficult.")
            .put("corrected", "I think English writing is very difficult.")
            .put("explanation", "Remove the unnecessary article \"the\" before \"English writing,\" and change \"a very difficult\" to \"very difficult.\"");

    public static final JSONObject EXAMPLE_SENTENCE2_JSON = new JSONObject()
            .put("original", "but it could be my personal opinion.")
            .put("corrected", "However, it might just be my personal opinion.")
            .put("explanation", "Replace \"but\" with \"However\" to start a new sentence, and use \"might just be\" to emphasize that the difficulty could be a personal opinion.");

    public static final JSONObject EXAMPLE_SENTENCE3_JSON = new JSONObject()
            .put("original", "so I think about it again today.")
            .put("corrected", "Therefore, I'm reconsidering it today.")
            .put("explanation", "Replace \"so\" with \"Therefore\" to show the logical connection between the previous sentences, and use \"reconsidering\" to convey the idea of thinking about the issue again.");


    public static JSONArray EXAMPLE_SENTENCE_JSON_ARRAY = new JSONArray()
            .put(EXAMPLE_SENTENCE1_JSON)
            .put(EXAMPLE_SENTENCE2_JSON)
            .put(EXAMPLE_SENTENCE3_JSON);

    // ChatGPT에게 문장을 교정해달라고 요청하는 프롬프트
    public static final String WRITING_INSTRUCTION_PREFIX =
            "Cut my speaking script by sentence one by one followed by corrected one and explanation in JSON array. " +
                    "JSON object has three attribute. \n" +
                    "1. original: original sentence. \n" +
                    "2. corrected: corrected sentence. \n" +
                    "3. explanation: explanation for correction. \n" +
                    "Here is the script : \n";

    private String INSTRUCTION = "I have to practice speaking for \"%s\" test. please give me a random question.";

    public String initWriting(LearningTestType learningTestType){
        String initialInstruction = getInitialInstruction(learningTestType.name());
        String question = openAiClient.chat(initialInstruction);

        return processTalk(question);
    }

    public String talk(LearningTestType learningTestType, String question, String userScript, Learning learning) {

        learning.setUserId(1L); // TODO - 로그인 구현 후 변경
        learning.setLearningTopic(question);
        learning.setLearningTestType(learningTestType);
        learning.setLearningType(LearningType.WRITING);

        learningRepository.save(learning);

        // 프롬프트 전송
        List<JSONObject> messages = new ArrayList<>();

        JSONObject userMessage = OpenAiClient.userMessage(WRITING_INSTRUCTION_PREFIX + EXAMPLE_SCRIPT);
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
