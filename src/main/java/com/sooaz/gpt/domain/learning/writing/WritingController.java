package com.sooaz.gpt.domain.learning.writing;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


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
    public String getSpeakingForm(
            @RequestParam String topicType,
            @RequestParam(required = false) String customTopic,
            @RequestParam(required = false) String predefinedTopic,
            Model model
    ) {
        log.info("topicType = {}", topicType);
        log.info("customTopic = {}", customTopic);

        String question;
        if (topicType.equals("customTopic")) {
            question = customTopic;
        } else {
            question = writingService.getRandomQuestion(predefinedTopic);
        }

        model.addAttribute("question", question);

        return "learning/writing/writingPractice";
    }

}
