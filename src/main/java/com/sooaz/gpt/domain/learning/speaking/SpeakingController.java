package com.sooaz.gpt.domain.learning.speaking;

import com.sooaz.gpt.domain.learning.NcpTtsClient;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;


@Controller
@RequiredArgsConstructor
@Slf4j
public class SpeakingController {

    private final SpeakingService speakingService;
    private final NcpTtsClient ncpTtsClient;

    @GetMapping("/learning/speaking")
    public String getTopicForm() {
        return "learning/speaking/speakingTopic";
    }

    @PostMapping("/learning/speaking")
    public String getSpeakingForm(
            @RequestParam LearningTestType learningTestType,
            Model model
    ) {
        System.out.println("learningTestType = " + learningTestType);
        log.info("learningTestType = {}", learningTestType);
        
        String question = speakingService.initSpeaking(learningTestType);

        model.addAttribute("learningTestType", learningTestType);
        model.addAttribute("question", question);

        return "learning/speaking/speakingPractice";
    }

    @GetMapping("/learning/speaking/tts")
    public void getTts(
            @RequestParam String question,
            HttpServletResponse response
    ) {
        ncpTtsClient.tts(question, response);
    }

}
