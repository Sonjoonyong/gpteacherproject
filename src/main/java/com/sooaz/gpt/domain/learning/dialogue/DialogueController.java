package com.sooaz.gpt.domain.learning.dialogue;

import com.sooaz.gpt.domain.learning.AzureClient;
import com.sooaz.gpt.domain.learning.NcpTtsClient;
import com.sooaz.gpt.domain.learning.OpenAiClient;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequiredArgsConstructor
@Slf4j
public class DialogueController {

    private final DialogueService dialogueService;
    private final NcpTtsClient ncpTtsClient;
    private final AzureClient azureClient;
    private final OpenAiClient openAiClient;

    @GetMapping("/learning/dialogue")
    public String getTopicForm() {
        return "learning/dialogue/dialogueTopic";
    }

    @PostMapping("/learning/dialogue")
    public String getPracticeForm(
            @ModelAttribute DialogueTopicDto dialogueTopicDto,
            Model model
    ) {
        String assistantTalk = dialogueService.initDialogue(dialogueTopicDto);
        Long learningId = dialogueService.saveLearn(dialogueTopicDto);

        model.addAttribute("assistantTalk", assistantTalk);
        model.addAttribute("learningId", learningId);

        return "learning/dialogue/dialoguePractice";
    }

    @ResponseBody
    @PostMapping("/learning/dialogue/talk")
    public String getAssistantResponse(
            @RequestParam String priorAssistantTalk,
            @RequestParam String userTalk,
            @RequestParam Long learningId
    ) {
        String string = dialogueService.talk(priorAssistantTalk, userTalk, learningId).toString();
        log.info("assistant response json = {}", string);
        return string;
    }

    @ResponseBody
    @PostMapping(value = "/learning/dialogue/transcript", produces = "application/json")
    public String transcript(
            @RequestParam MultipartFile audio,
            @RequestParam String priorAssistantTalk,
            @RequestParam Long learningId,
            HttpServletRequest request
    ) throws IOException {

        log.info("learningId = {}", learningId);
        String directory = request.getServletContext().getRealPath("/WEB-INF/files");
        String userTalk = openAiClient.transcript(directory, audio);
        String result = dialogueService.talk(priorAssistantTalk, userTalk, learningId).toString();

        log.info("userTalk = {}", userTalk);
        log.info("result = {}", result);
        return result;
    }

    @GetMapping("/learning/dialogue/tts")
    public void getTts(
            @RequestParam String assistantTalk,
            HttpServletResponse response
    ) {
        ncpTtsClient.tts(assistantTalk, response);
    }

    @ResponseBody
    @PostMapping("/learning/dialogue/pronunciation")
    public String getPronunciationAssessment(
            MultipartFile audio,
            @RequestParam String userTalk,
            HttpServletRequest request
    ) {
        String directory = request.getServletContext().getRealPath("/WEB-INF/files/");
        return azureClient.pronunciationAssessment(directory, audio, userTalk);
    }
}