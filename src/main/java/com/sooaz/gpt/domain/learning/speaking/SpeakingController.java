package com.sooaz.gpt.domain.learning.speaking;


import com.sooaz.gpt.domain.learning.AzureClient;
import com.sooaz.gpt.domain.learning.NcpTtsClient;
import com.sooaz.gpt.domain.learning.OpenAiClient;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
@RequiredArgsConstructor
public class SpeakingController {
        private final SpeakingService speakingService;
        private final OpenAiClient openAiClient;
        private final NcpTtsClient ncpTtsClient;
        private final AzureClient azureClient;

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
                String assistantQuestion = speakingService.initSpeaking(speakingDTO);

                model.addAttribute("assistantQuestion", assistantQuestion);

                return "learning/speaking/speakingPractice";
        }

        @GetMapping("/learning/speaking/tts")
        public  void getTts(
                @RequestParam String assistantQuestion,
                HttpServletResponse response
        ){
            ncpTtsClient.tts(assistantQuestion,response);
        }

        @ResponseBody
        @PostMapping("/learning/speakingPractice")
        public String transcript(
                @RequestParam MultipartFile audio
        ) throws IOException {
                String script = openAiClient.transcript(audio);
                return script;
        }

}