package com.sooaz.gpt.domain.learning.writing;

import com.sooaz.gpt.domain.learning.OpenAiClient;
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

    public JSONObject evaluateAnswer(String answer) {
        // OpenAiClient.chat()을 사용해서 답변을 평가한다.

        return null;
    }
}
