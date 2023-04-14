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

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //whisper STT Speech To Text **어려움**
    @PostMapping("/learning/learningCorrection") //주소창에표시되는부분
    public String transcript(
            @RequestParam MultipartFile audio,
            Model model,
            HttpSession session,
            HttpServletRequest request
    ) throws IOException {
        String question=request.getParameter("question");
        String answer = openAiClient.transcript(audio);
        model.addAttribute("answer",answer);
        model.addAttribute("question",question);
        session.setAttribute("answer",answer);
        session.setAttribute("question",question);

        String correctedAnswer = speakingService.evaluateAnswer(answer, question);
        model.addAttribute("correctedAnswer", correctedAnswer);
        session.setAttribute("correctedAnswer", correctedAnswer);

        storeAnalysisData(session, answer, correctedAnswer);
        return "learning/learningCorrection"; //데이터를 보내는jsp?
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // 문장별 분석 페이지
    @GetMapping("/sentences")
    public String showSentenceAnalysisPage(
            Model model,
            HttpSession session
            ) {
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
        JSONArray analysis = speakingService.getAnalysisData(answer, correctedAnswer);
        session.setAttribute("analysis", analysis);
    }

    // 문장별 분석 처리
    @GetMapping("/analysis")
    public String handleAnalysisBySentence(Model model, HttpSession session) throws IOException {

        //String answer = (String) model.getAttribute("answer");//대현수정
        //String correctedAnswer = (String) model.getAttribute("correctedAnswer");//대현수정
        String answer = (String) session.getAttribute("answer");
        String correctedAnswer = (String) session.getAttribute("correctedAnswer");

        // 분석 데이터 가져오기
        JSONArray analysis = speakingService.getAnalysisData(answer, correctedAnswer);
        model.addAttribute("analysis", analysis);

        return "learning/learningSentences";
    }

}
