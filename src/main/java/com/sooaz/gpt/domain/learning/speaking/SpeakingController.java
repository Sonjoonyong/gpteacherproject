package com.sooaz.gpt.domain.learning.speaking;


import com.sooaz.gpt.domain.learning.NcpTtsClient;
import com.sooaz.gpt.domain.learning.OpenAiClient;
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
        private final OpenAiClient openAiClient;

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

                model.addAttribute(assistantQuestion, assistantQuestion);

                return "learning/speaking/speakingPractice";
        }
       /* @PostMapping("/learning/speaking/talk")
        public String getAssistantResponse(

        ){
                return speakingService.talk();
        }*/
        @GetMapping("/learning/speaking/tts")
        public  void getTts(
                @RequestParam String assistantAnswer,
                HttpServletResponse response
        ){
                //NcpTtsClient.tts(assistantAnswer,response);
        }

        /*    @ResponseBody
        @PostMapping("/learning/dialogue/transcript")
        public String transcript(
                @RequestParam MultipartFile audio
        ) throws IOException {
                String script = openAiClient.transcript(audio);
                return script;
        }
                */


}