package com.sooaz.gpt.domain.learning.writing;

import com.sooaz.gpt.domain.learning.PerspectiveClient;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/learning")
public class WritingController {

    // 의존성 주입
    @Autowired
    private WritingService writingService;

    @Autowired
    private PerspectiveClient perspectiveClient;

    // 비속어 체크
    private boolean checkProfanity(String text) {
        double profanityScore = perspectiveClient.getProfanityScore(text);
        return profanityScore > 0.7;
    }

    // 주제 선택 페이지
    @GetMapping("/writing")
    public String showSelectTopicPage(Model model) {
        return "learning/writing/writingTopic";
    }

    // 글쓰기 연습 처리
    @PostMapping("/writing")
    public String handleWritingPractice(@RequestParam("action") String action,
                                        @RequestParam(value = "topicType", required = false) String topicType,
                                        @RequestParam(value = "predefinedTopic", required = false) String topicId,
                                        @RequestParam(value = "customTopic", required = false) String customTopic,
                                        @RequestParam(value = "topic", required = false) String topic,
                                        @RequestParam(value = "answer", required = false) String answer,
                                        Model model) throws IOException {
        // 주제 선택 후 시작 버튼을 누른 경우
        if ("start".equals(action)) {
            String topicName;
            if ("custom".equals(topicType)) {
                topicName = customTopic;
                // 주제에 비속어가 있는지 확인
                if (checkProfanity(topicName)) {
                    model.addAttribute("errorMessage", "부적절한 답변입니다.");
                    return "learning/writing/writingTopic";
                }
            } else {
                // 미리 정의된 주제를 선택한 경우
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
            // 질문 생성
            String question = writingService.generateQuestion(topicName);
            model.addAttribute("topic", topicName);
            model.addAttribute("question", question);
            return "learning/writing/writingPractice";
        } else if ("submit".equals(action)) {
            // 답변을 제출한 경우
            String question = writingService.generateQuestion(topic);
            model.addAttribute("question", question);

            // 답변에 비속어가 있는지 확인
            if (checkProfanity(answer)) {
                model.addAttribute("errorMessage", "부적절한 답변입니다.");
                model.addAttribute("topic", topic);
                return "learning/writing/writingPractice";
            }
            // 답변 평가 및 수정
            String correctedAnswer = writingService.evaluateAnswer(answer, question);
            model.addAttribute("topic", topic);
            model.addAttribute("answer", answer);
            model.addAttribute("correctedAnswer", correctedAnswer);
            return "learning/learningCorrection";
        } else {
            // 그 외의 경우 주제 선택 페이지로 이동
            return "redirect:/learning/writing";
        }
    }

    // 문제와 답변을 제출한 후 처리
    @PostMapping("/correction")
    public String handleSubmitQuestionAndAnswer(
            @RequestParam("answer") String answer,
            @RequestParam("question") String question,
            Model model, HttpSession session) throws IOException {

        // AnalysisData 가져오기
        JSONArray analysisData = writingService.getAnalysisData(answer, question);

        // 답변 평가 및 수정
        String correctedAnswer = writingService.evaluateAnswer(answer, question);

        model.addAttribute("question", question);
        model.addAttribute("answer", answer);
        model.addAttribute("correctedAnswer", correctedAnswer);

        // 분석 데이터 저장
        storeAnalysisData(session, answer, correctedAnswer);

        return "learning/learningCorrection";
    }

    // 문장별 분석 페이지
    @GetMapping("/sentences")
    public String showSentenceAnalysisPage(Model model, HttpSession session) {
        JSONArray jsonArray = (JSONArray) session.getAttribute("analysis");
        List<Map<String, Object>> analysis = new ArrayList<>();

        // 분석 데이터 리스트에 추가
        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            Map<String, Object> item = new HashMap<>();
            item.put("original", jsonObject.getString("original"));
            item.put("corrected", jsonObject.getString("corrected"));

            if (jsonObject.has("explanation")) {
                item.put("explanation", jsonObject.getString("explanation"));
            } else {
                item.put("explanation", "No correction needed.");
            }

            analysis.add(item);
        }

        model.addAttribute("analysis", analysis);
        return "/learning/learningSentences";
    }

    // 분석 데이터를 세션에 저장
    private void storeAnalysisData(HttpSession session, String answer, String correctedAnswer) throws IOException {
        JSONArray analysis = writingService.getAnalysisData(answer, correctedAnswer);
        session.setAttribute("analysis", analysis);
    }

    // 문장별 분석 처리
    @GetMapping("/analysis")
    public String handleAnalysisBySentence(Model model, HttpSession session) throws IOException {
        String answer = (String) session.getAttribute("answer");
        String correctedAnswer = (String) session.getAttribute("correctedAnswer");

        // 분석 데이터 가져오기
        JSONArray analysis = writingService.getAnalysisData(answer, correctedAnswer);
        model.addAttribute("analysis", analysis);

        return "learning/learningSentences";
    }

    // 좋아요
    @ResponseBody
    @GetMapping("/learning/writing/statusUpdate")
    public String updateStatus(
            @RequestParam Long sentenceId,
            @RequestParam String type
    ) {
        char currentStatus = writingService.updateStatus(sentenceId, type); // 업데이트된 상태 반환
        return Character.toString(currentStatus);
    }


}

