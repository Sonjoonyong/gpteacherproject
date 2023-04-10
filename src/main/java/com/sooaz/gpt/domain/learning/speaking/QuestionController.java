package com.sooaz.gpt.domain.learning.speaking;

import com.sooaz.gpt.domain.learning.OpenAiClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class QuestionController {
    @Autowired
    private com.sooaz.gpt.domain.learning.OpenAiClient OpenAiClient;

    @PostMapping("/gpt/speakingPractice")
    @ResponseBody
    public String speaking_question(@RequestParam("TOPIC") String topic) {
        String prompt = "{\"prompt\": \"" + topic + "과 관련된 영어문제 내줘\"}";
        return prompt;
    }


}
