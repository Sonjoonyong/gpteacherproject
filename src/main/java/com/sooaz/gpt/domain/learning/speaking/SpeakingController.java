package com.sooaz.gpt.domain.learning.speaking;


import com.sooaz.gpt.domain.learning.AzureClient;
import com.sooaz.gpt.domain.learning.NcpTtsClient;
import com.sooaz.gpt.domain.learning.OpenAiClient;
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
    private final OpenAiClient openAiClient;


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
        String question = speakingService.initSpeaking(speakingDTO);
        model.addAttribute("question", question);
        return "learning/speaking/speakingPractice";
    }

    //TTS Test to Speech
    @GetMapping("/learning/speaking/tts")
    public void getTts(
            @RequestParam String question,
            HttpServletResponse response
    ) {
        ncpTtsClient.tts(question, response);
    }


    //whisper STT Speech To Text **어려움**
    @PostMapping("/learning/learningCorrection")
    public String transcript(
            @RequestParam MultipartFile audio,
            Model model,
            HttpServletRequest request
    ) throws IOException {
        String question=request.getParameter("question");
        String answer = openAiClient.transcript(audio);
        model.addAttribute("answer",answer);
        model.addAttribute("question",question);
        return "/learning/learningCorrection";
    }







}
