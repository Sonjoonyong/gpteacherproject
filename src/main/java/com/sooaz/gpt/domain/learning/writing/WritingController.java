package com.sooaz.gpt.domain.learning.writing;

import com.sooaz.gpt.domain.learning.PerspectiveClient;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@Slf4j
public class WritingController {

    private final WritingService writingService;

    @GetMapping("/learning/writing")
    public String getTopicForm() {
        return "learning/writing/writingTopic";
    }

    @PostMapping("/learning/writing")
    public String getWritingForm(
            @RequestParam String topicType,
            @RequestParam(required = false) String customTopic,
            @RequestParam(required = false) String predefinedTopic,
            Model model
    ) {
        log.info("topicType = {}", topicType);
        log.info("customTopic = {}", customTopic);

        String question;
        String topic = "";
        if (topicType.equals("customTopic")) {
            question = customTopic;
        } else {
            question = writingService.getRandomQuestion(predefinedTopic);
            topic = " - "+predefinedTopic;
        }

        model.addAttribute("topic", topic);
        model.addAttribute("question", question);

        return "learning/writing/writingPractice";
    }

    @ResponseBody
    @GetMapping("/learning/writing/word")
    public String recommendWord(
            @RequestParam String question,
            @RequestParam String answer
    ) {
        if (answer.length() < 10 || answer.length() > 1000) {
            return "retry";
        }
        return writingService.recommendWord(question, answer);
    }

}
