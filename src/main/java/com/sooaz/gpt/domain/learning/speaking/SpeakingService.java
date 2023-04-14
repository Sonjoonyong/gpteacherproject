package com.sooaz.gpt.domain.learning.speaking;

import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.*;


@Service
@RequiredArgsConstructor
public class SpeakingService {
    private final OpenAiClient openAiClient;


    private String INSTRUCTION = "i have to practice speaking for \"%s\" test. please give me one question (sentences related to the \"%s\" test).";


    public String initSpeaking(SpeakingDTO speakingDTO){

        String initialInstruction = getInitialInstruction(speakingDTO);

        String question = openAiClient.chat(initialInstruction);

        return question;
    }

    private String getInitialInstruction(SpeakingDTO speakingDTO){
        //지시문 설정
        return String.format(
                INSTRUCTION,
                speakingDTO.getTOPIC(),
                speakingDTO.getTOPIC()
        );
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //준용님파트
    public String evaluateAnswer(String answer, String question) throws IOException {
        String prompt = "Correct the following sentence: " + answer;
        String response = openAiClient.chat(prompt);

        // 응답 올바르게 처리
        if (response.trim().startsWith("{")) {
            JSONObject jsonObject = new JSONObject(response);
            JSONArray jsonArray = jsonObject.getJSONArray("choices");
            JSONObject choice = jsonArray.getJSONObject(0);
            JSONObject message = choice.getJSONObject("message");
            String content = message.getString("content").trim();

            if (content.startsWith("{")) {
                JSONObject contentJson = new JSONObject(content);
                return contentJson.optString("corrected", content);
            } else {
                return content;
            }
        } else {
            return response.trim();
        }
    }

    public JSONArray getAnalysisData(String answer, String correctedAnswer) throws IOException {
        JSONArray analysis = new JSONArray();

        List<String> originalSentences = Arrays.asList(answer.split("(?<=[.!?])\\s*"));
        List<String> correctedSentences = Arrays.asList(correctedAnswer.split("(?<=[.!?])\\s*"));

        for (int i = 0; i < originalSentences.size(); i++) {
            String original = originalSentences.get(i).trim();
            String corrected = correctedSentences.get(i).trim();

            String explanation = null;
            if (!original.equals(corrected)) {
                explanation = getCorrectionExplanation(original, corrected).trim();
            } else {
                List<String> originalTokens = Arrays.asList(original.split("\\s+"));
                List<String> correctedTokens = Arrays.asList(corrected.split("\\s+"));

                if (originalTokens.size() >= 2 && correctedTokens.size() >= 2) {
                    explanation = "No correction needed.";
                }
            }

            JSONObject item = new JSONObject();
            item.put("original", original);
            item.put("corrected", corrected);
            item.put("explanation", explanation);

            analysis.put(item);
        }

        return analysis;
    }

    public String getCorrectionExplanation(String original, String corrected) {
        String prompt = String.format("Explain the difference between the original sentence and the corrected sentence in a concise manner:\n\nOriginal: %s\nCorrected: %s", original, corrected);
        return openAiClient.chat(prompt);
    }


}
