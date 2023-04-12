package com.sooaz.gpt.domain.learning.writing;

import com.sooaz.gpt.domain.learning.PerspectiveClient;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("/learning")
public class WritingController {

    @Autowired
    private WritingService writingService;

    @Autowired
    private PerspectiveClient perspectiveClient;

    private boolean checkProfanity(String text) {
        double profanityScore = perspectiveClient.getProfanityScore(text);
        return profanityScore > 0.7;
    }

    @GetMapping("/writing")
    public String showSelectTopicPage(Model model) {
        return "learning/writing/writingTopic";
    }

    @PostMapping("/writing")
    public String handleWritingPractice(@RequestParam("action") String action,
                                        @RequestParam(value = "topicType", required = false) String topicType,
                                        @RequestParam(value = "predefinedTopic", required = false) String topicId,
                                        @RequestParam(value = "customTopic", required = false) String customTopic,
                                        @RequestParam(value = "topic", required = false) String topic,
                                        @RequestParam(value = "answer", required = false) String answer,
                                        Model model) throws IOException {
        if ("start".equals(action)) {
            String topicName;
            if ("custom".equals(topicType)) {
                topicName = customTopic;
                if (checkProfanity(topicName)) {
                    model.addAttribute("errorMessage", "비속어를 사용할 수 없습니다.");
                    return "learning/writing/writingTopic";
                }
            } else {
                switch (topicId) {
                    case "1":
                        topicName = "Politics";
                        break;
                    case "2":
                        topicName = "Society";
                        break;
                    case "3":
                        topicName = "Economic";
                        break;
                    case "4":
                        topicName = "Entertainment";
                        break;
                    case "5":
                        topicName = "Sports";
                        break;
                    default:
                        return "redirect:/learning/writing";
                }
            }
            String question = writingService.generateQuestion(topicName);
            model.addAttribute("topic", topicName);
            model.addAttribute("question", question);
            return "learning/writing/writingPractice";
        } else if ("submit".equals(action)) {
            String question = writingService.generateQuestion(topic);

            if (checkProfanity(answer)) {
                model.addAttribute("errorMessage", "비속어를 사용할 수 없습니다.");
                model.addAttribute("topic", topic);
                model.addAttribute("question", question);
                return "learning/writing/writingPractice";
            }
            JSONObject evaluation = writingService.evaluateAnswer(answer);

            model.addAttribute("topic", topic);
            model.addAttribute("question", question);

            return "learning/writing/writingPractice";
        } else {
            return "redirect:/learning/writing";
        }
    }
}
