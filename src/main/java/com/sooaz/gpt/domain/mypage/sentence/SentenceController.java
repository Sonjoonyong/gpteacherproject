package com.sooaz.gpt.domain.mypage.sentence;

import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.learning.LearningTestType;
import com.sooaz.gpt.domain.learning.PerspectiveClient;
import com.sooaz.gpt.domain.learning.speaking.SpeakingService;
import com.sooaz.gpt.domain.learning.writing.WritingService;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SentenceController {

    private final SentenceRepository sentenceRepository;
    private final SpeakingService speakingService;
    private final WritingService writingService;
    private final SentenceService sentenceService;
    private final OpenAiClient openAiClient;
    private final PerspectiveClient perspectiveClient;

    @GetMapping("/learning/correction/sentences")
    public String getSentenceCorrection(
            @RequestParam Long learningId,
            Model model
    ) {
        List<Sentence> sentences = sentenceRepository.findAllByLearningId(learningId);

        model.addAttribute("sentences", sentences);

        return "learning/sentenceCorrection";
    }

    @ResponseBody
    @GetMapping("/learning/sentence/statusUpdate")
    public String updateStatus(
            @RequestParam Long sentenceId,
            @RequestParam String type
    ) {
        char currentStatus = sentenceService.updateStatus(sentenceId, type); //update된 상태 반환
        return Character.toString(currentStatus);
    }

    @ResponseBody
    @GetMapping("/learning/sentence/profanity")
    public String checkProfanity(
            @RequestParam String text
    ) {
        double profanityScore = perspectiveClient.getProfanityScore(text);
        return Boolean.toString(profanityScore > 0.7);
    }

    @PostMapping("/learning/correction/script")
    public String transcript(
            //@RequestParam(required = false) MultipartFile audio,
            @RequestParam(required = false) String userScript,
            @RequestParam String question,
            @RequestParam(required = false) LearningTestType learningTestType,
            Model model
            //HttpServletRequest request
    ) throws IOException {

//        String userScript;
//
//        if (audio != null) {
//            String directory = request.getServletContext().getRealPath("/WEB-INF/files");
//            userScript = openAiClient.transcript(directory, audio);
//        } else {
//            userScript = writingScript;
//        }

        Learning learning = new Learning();

        String correctedScript = speakingService.talk(learningTestType, question, userScript, learning);

        model.addAttribute("userScript", userScript);
        model.addAttribute("question", question);
        model.addAttribute("correctedScript", correctedScript);
        model.addAttribute("learningId", learning.getId());

        log.info("userScript = {}", userScript);
        log.info("correctedScript = {}", correctedScript);

        return "learning/learningCorrection";
    }

    @ResponseBody
    @PostMapping(value = "/learning/sentence/profanity")
    public String checkProfanity(
            @RequestParam(required = false) MultipartFile audio,
            @RequestParam(required = false) String text,
            HttpServletRequest request
    ) throws IOException {
        String userScript="";
        if (audio != null) {
            String directory = request.getServletContext().getRealPath("/WEB-INF/files");
            userScript = openAiClient.transcript(directory, audio);
        } else {
            userScript =  text;
        }
        double profanityScore = perspectiveClient.getProfanityScore(userScript);

        JSONObject json = new JSONObject();
        json.put("profanity", Boolean.toString(profanityScore > 0.7));
        json.put("userScript", userScript);
        return json.toString();
    }
}
