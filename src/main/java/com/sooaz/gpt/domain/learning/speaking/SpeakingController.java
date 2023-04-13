package com.sooaz.gpt.domain.learning.speaking;


import com.sooaz.gpt.domain.learning.AzureClient;
import com.sooaz.gpt.domain.learning.NcpTtsClient;
import com.sooaz.gpt.domain.learning.dialogue.DialogueTopicDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@Controller
@RequiredArgsConstructor
public class SpeakingController {

    private final SpeakingService speakingService;
    private final NcpTtsClient ncpTtsClient;
    private final AzureClient azureClient;

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
    /*
    @ResponseBody
    @PostMapping("/learning/speaking/pronunciation")
    public String getPronunciationAssessment(
            MultipartFile audio,
            @RequestParam String userTalk,
            HttpServletRequest request
    ) {
        return "learning/speaking/speakingPractice";
    }
    */

    /*
    @PostMapping("/correction")
    public String handleSubmitQuestionAndAnswer(

            @RequestParam("assistantQuestion") String question,
            @ModelAttribute DialogueTopicDto dialogueTopicDto,
            @RequestParam("answer") String answer,
            @RequestParam("TOPIC") String topic,
            Model model, HttpSession session
        ) throws IOException {


        String correctedAnswer = speakingService.evaluateAnswer(answer, question);
        model.addAttribute("question", question);
        model.addAttribute("answer", answer);
        model.addAttribute("correctedAnswer", correctedAnswer);

        storeAnalysisData(session, answer, correctedAnswer);

        return "learning/learningCorrection";
        }
    */


}
