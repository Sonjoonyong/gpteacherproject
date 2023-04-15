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
            @RequestParam LearningTestType learningTestType,
            Model model
    ) {
        System.out.println("learningTestType = " + learningTestType);
        log.info("learningTestType = {}", learningTestType);

        String question = writingService.initWriting(learningTestType);

        model.addAttribute("learningTestType", learningTestType);
        model.addAttribute("question", question);

        return "learning/writing/writingPractice";
    }

}
