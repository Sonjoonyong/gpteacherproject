package com.sooaz.gpt.domain.learning.dialogue;

import com.sooaz.gpt.domain.learning.NcpTtsClient;
import com.sooaz.gpt.domain.learning.OpenAiClient;
import lombok.RequiredArgsConstructor;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class DialogueController {

    private final DialogueService dialogueService;
    private final NcpTtsClient ncpTtsClient;

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
            @RequestParam String assistantTalk,
            @RequestParam String userTalk,
            @RequestParam Long learningId
    ) {
        JSONObject assistantTalkJsonObject = dialogueService.talk(assistantTalk, userTalk, learningId);
        String newAssistantTalk = assistantTalkJsonObject.getString("answer");
        String correctedSentence = assistantTalkJsonObject.getString("corrected");
        String explanation = assistantTalkJsonObject.getString("explanation");

        JSONObject res = new JSONObject();
        res.put("newAssistantTalk",newAssistantTalk);
        res.put("correctedSentence",correctedSentence);
        res.put("explanation",explanation);

        return res.toString();
    }

    @GetMapping("/learning/dialogue/tts")
    public void getTts(
            @RequestParam String assistantTalk,
            HttpServletResponse response
    ) {
        ncpTtsClient.tts(assistantTalk, response);
    }

    @ResponseBody
    @PostMapping("/learning/dialogue/transcript")
    public String transcript(
            @RequestParam MultipartFile audio
    ) throws IOException {
        String script = openAiClient.transcript(audio);
        return script;
    }
}