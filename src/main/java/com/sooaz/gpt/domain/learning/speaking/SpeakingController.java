package com.sooaz.gpt.domain.learning.speaking;


import com.sooaz.gpt.domain.learning.NcpTtsClient;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;


@Controller
@RequiredArgsConstructor
public class SpeakingController {

    private final SpeakingService speakingService;
    private final NcpTtsClient ncpTtsClient;

    //Topic
    @GetMapping("/learning/speaking")
    public String getTopicForm() {
        return "learning/speaking/speakingTopic";
    }

    //Practice
    @PostMapping("/learning/speaking")
    public String getSpeakingForm(
            @ModelAttribute SpeakingDTO speakingDTO,
            Model model

    ) {
        String assistantQuestion = speakingService.initSpeaking(speakingDTO);

        model.addAttribute("assistantQuestion", assistantQuestion);

        return "learning/speaking/speakingPractice";
    }

    //
    @GetMapping("/learning/speaking/tts")
    public void getTts(
            @RequestParam String assistantQuestion,
            HttpServletResponse response
    ) {
        ncpTtsClient.tts(assistantQuestion, response);

    }

}
