package com.sooaz.gpt.domain.learning.speaking;



import com.sooaz.gpt.domain.learning.NcpTtsClient;
import com.sooaz.gpt.domain.learning.OpenAiClient;

import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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

    //준용님파트
    @PostMapping("/learning/learningCorrection")
    public String handleSubmitQuestionAndAnswer(
            @RequestParam("answer") String answer,
            @RequestParam("question") String question,
            @RequestParam("topic") String topic,
            Model model,
            HttpSession session) throws IOException {

        String correctedAnswer = SpeakingService.evaluateAnswer(answer, question);
        answer = (String) session.getAttribute("answer");
        question = (String) session.getAttribute("question") ;
        model.addAttribute("correctedAnswer", correctedAnswer);

        storeAnalysisData(session, answer, correctedAnswer);

        return "learning/learningCorrection";
    }
    @GetMapping("/sentences")
    public String showSentenceAnalysisPage(Model model, HttpSession session) {
        JSONArray jsonArray = (JSONArray) session.getAttribute("analysis");
        List<Map<String, Object>> analysis = new ArrayList<>();

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


    private void storeAnalysisData(HttpSession session, String answer, String correctedAnswer) throws IOException {
        JSONArray analysis = writingService.getAnalysisData(answer, correctedAnswer);
        session.setAttribute("analysis", analysis);
    }

    @GetMapping("/analysis")
    public String handleAnalysisBySentence(Model model, HttpSession session) throws IOException {
        String answer = (String) session.getAttribute("answer");
        String correctedAnswer = (String) session.getAttribute("correctedAnswer");

        JSONArray analysis = writingService.getAnalysisData(answer, correctedAnswer);
        model.addAttribute("analysis", analysis);

        return "learning/learningSentences";
    }





}
