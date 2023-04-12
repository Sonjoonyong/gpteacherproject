package com.sooaz.gpt.domain.learning.writing;

import com.sooaz.gpt.domain.learning.OpenAiClient;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

@Service
public class WritingService {

    @Autowired
    private OpenAiClient openAiClient;

    public String generateQuestion(String topic) throws IOException {
        // 각 주제에 대해 프롬프트 목록 정의
        List<String> promptsPolitics = Arrays.asList("Generate a question about political systems.", "Generate a question about political ideologies.", "Generate a question about the role of government in society.");
        List<String> promptsSociety = Arrays.asList("Generate a question about social issues.", "Generate a question about the role of technology in society.", "Generate a question about cultural diversity.");
        List<String> promptsEconomy = Arrays.asList("Generate a question about economic systems.", "Generate a question about international trade.", "Generate a question about the role of central banks.");
        List<String> promptsEntertainment = Arrays.asList("Generate a question about movies.", "Generate a question about music.", "Generate a question about popular television shows.");
        List<String> promptsSports = Arrays.asList("Generate a question about famous athletes.", "Generate a question about the history of a specific sport.", "Generate a question about the Olympics.");

        // 주제에 따라 적절한 목록에서 임의 프롬프트를 선택
        Random random = new Random();
        String prompt;
        switch (topic) {
            case "Politics":
                prompt = promptsPolitics.get(random.nextInt(promptsPolitics.size()));
                break;
            case "Society":
                prompt = promptsSociety.get(random.nextInt(promptsSociety.size()));
                break;
            case "Economy":
                prompt = promptsEconomy.get(random.nextInt(promptsEconomy.size()));
                break;
            case "Entertainment":
                prompt = promptsEntertainment.get(random.nextInt(promptsEntertainment.size()));
                break;
            case "Sports":
                prompt = promptsSports.get(random.nextInt(promptsSports.size()));
                break;
            default:
                prompt = "Generate 3 different questions related to the topic: " + topic;
                break;
        }

        // ChatGPT 사용하여 선택한 프롬프트에 따라 질문 생성
        String questions = openAiClient.chat(prompt);

        String[] questionList = questions.split("\n");
        String question = questionList[random.nextInt(questionList.length)];

        // 앞에 숫자 붙는 것 삭제
        question = question.replaceAll("^\\d+\\.", "").trim();

        return question;
    }

    public String evaluateAnswer(String userAnswer, String question) throws IOException {
        String prompt = "Correct the following sentence: " + userAnswer;
        String response = openAiClient.chat(prompt);

        // Handle the response correctly
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
    public JSONArray getAnalysisData(String originalAnswer, String correctedAnswer) throws IOException {
        JSONArray analysis = new JSONArray();

        List<String> originalSentences = Arrays.asList(originalAnswer.split("(?<=[.!?])\\s*"));
        List<String> correctedSentences = Arrays.asList(correctedAnswer.split("(?<=[.!?])\\s*"));

        for (int i = 0; i < originalSentences.size(); i++) {
            String original = originalSentences.get(i).trim();
            String corrected = correctedSentences.get(i).trim();

            String explanation = null;
            if (!original.equals(corrected)) {
                explanation = getCorrectionExplanation(original, corrected).trim();
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
