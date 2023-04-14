package com.sooaz.gpt.domain.learning.speaking;

import com.sooaz.gpt.domain.learning.NcpTtsClient;
import com.sooaz.gpt.domain.learning.OpenAiClient;

import com.sooaz.gpt.domain.mypage.learning.Learning;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
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

        model.addAttribute("topic", speakingDTO.getTopic());
        model.addAttribute("question", question);

        return "learning/speaking/speakingPractice";
    }
//
//    @ResponseBody
//    @PostMapping("/learning/speaking/talk")
//    public String getAssistantResponse(
//            @RequestParam String priorAssistantTalk,
//            @RequestParam String userTalk,
//            @RequestParam Long learningId
//    ) {
//        String string = speakingService.talk(priorAssistantTalk, userTalk, learningId).toString();
//        log.info("assistant response json = {}", string);
//        return string;
//    }



    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //whisper STT Speech To Text **어려움**
    @PostMapping(value="/learning/learningCorrection")
    public String transcript(
            @RequestParam MultipartFile audio,
            @RequestParam String question,
            @RequestParam String learningTestType,
            Model model,
            HttpServletRequest request
    ) throws IOException {
        Learning learning = new Learning();
        String directory = request.getServletContext().getRealPath("/WEB-INF/files");
        String userScript = openAiClient.transcript(directory, audio);
        String correctedScript = speakingService.talk(learningTestType, question, userScript, learning);

        model.addAttribute("userScript", userScript);
        model.addAttribute("question", question);
        model.addAttribute("correctedScript", correctedScript);
        model.addAttribute("learningId", learning.getId());

        log.info("learningId = {}", learning.getId());
        log.info("userScript = {}", userScript);
        log.info("correctedScript = {}", correctedScript);

        return "learning/learningCorrection";
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
    // 문장별 분석 페이지
//    @GetMapping("/sentences")
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
