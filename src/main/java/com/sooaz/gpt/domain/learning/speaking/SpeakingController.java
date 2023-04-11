package com.sooaz.gpt.domain.learning.speaking;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequiredArgsConstructor
public class SpeakingController {
    private final SpeakingService speakingService;

    //Topic
    @GetMapping("/learning/speaking")
    public String getTopicForm(){
        return "learning/speaking/speakingTopic";
    }

    //Practice
    @PostMapping("/learning/speaking")
    public String getSpeakingForm(
            @ModelAttribute SpeakingDTO speakingDTO,
            Model model

    ) {

        return "learning/speaking/speakingPractice";
    }



}
