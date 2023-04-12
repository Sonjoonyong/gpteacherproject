package com.sooaz.gpt.domain.learning.dialogue;

import com.sooaz.gpt.domain.learning.NcpTtsClient;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequiredArgsConstructor
public class DialogueController {

    private final DialogueService dialogueService;
    private final NcpTtsClient ncpTtsClient;

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
            @RequestParam String assistantTalk,
            @RequestParam String userTalk,
            @RequestParam Long learningId
    ) {
        return dialogueService.talk(assistantTalk, userTalk, learningId);
    }

    @GetMapping("/learning/dialogue/tts")
    public void getTts(
            @RequestParam String assistantTalk,
            HttpServletResponse response
    ) {
        ncpTtsClient.tts(assistantTalk, response);
    }
}