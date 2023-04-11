package com.sooaz.gpt.domain.learning.writing;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;

@Controller
@RequestMapping("/learning")
public class WritingController {

    @Autowired
    private WritingService writingService;

    @GetMapping("/writing")
    public String showSelectTopicPage(Model model) {
        // 주제 선정 Get
        return "learning/writing/writingTopic";
    }

    @PostMapping("/writing")
    public String startWritingPractice(@RequestParam("topicType") String topicType,
                                       @RequestParam(value = "predefinedTopic", required = false) String topicId,
                                       @RequestParam(value = "customTopic", required = false) String customTopic,
                                       Model model) throws IOException {
        // 주제 선정 Post
        String topicName;
        if ("custom".equals(topicType)) {
            topicName = customTopic;
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
    }

    @PostMapping("/submitQuestionAndAnswer")
    public String submitQuestionAndAnswer(@RequestParam("topic") String topic,
                                          @RequestParam("answer") String answer) throws IOException {
        // 질문 생성
        String question = writingService.generateQuestion(topic);

        // 답변 평가
        JSONObject evaluation = writingService.evaluateAnswer(answer);

        return "learning/writing/writingPractice";
    }
}
