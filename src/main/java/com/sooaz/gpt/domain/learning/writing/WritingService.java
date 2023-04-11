package com.sooaz.gpt.domain.learning.writing;

import com.sooaz.gpt.domain.learning.OpenAiClient;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Service
public class WritingService {

    @Autowired
    private OpenAiClient openAiClient;

    public String generateQuestion(String topic) throws IOException {
        // OpenAiClient.chat()을 사용해서 선택한 주제에 따라 질문을 생성한다.
        List<JSONObject> messages = Arrays.asList(
                new JSONObject().put("role", "system").put("content", "Generate a question related to the topic: " + topic)
        );

        String question = openAiClient.chat(messages);
        return question;
    }

    public JSONObject evaluateAnswer(String answer) {
        // OpenAiClient.chat()을 사용해서 답변을 평가한다.

        return null;
    }
}
