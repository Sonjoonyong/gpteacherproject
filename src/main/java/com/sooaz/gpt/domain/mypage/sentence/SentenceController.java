package com.sooaz.gpt.domain.mypage.sentence;

import com.sooaz.gpt.domain.learning.LearningTestType;
import com.sooaz.gpt.domain.learning.OpenAiClient;
import com.sooaz.gpt.domain.learning.speaking.SpeakingService;
import com.sooaz.gpt.domain.learning.writing.WritingService;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

import com.sooaz.gpt.domain.learning.PerspectiveClient;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SentenceController {

    private final SentenceRepository sentenceRepository;
    private final LearningRepository learningRepository;
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
    @PostMapping("/learning/sentences/{sentenceId}/like")
    public String toggleLike(
            @PathVariable Long sentenceId
    ) {
        return sentenceService.toggleLike(sentenceId);
    }

    @ResponseBody
    @PostMapping("/learning/sentences/{sentenceId}/flashcard")
    public String toggleStorage(
            @SessionAttribute User loginUser,
            @PathVariable Long sentenceId
    ) {
        return sentenceService.toggleStorage(loginUser.getId(), sentenceId);
    }

    @PostMapping("/learning/correction/script")
    public String transcript(
            @SessionAttribute User loginUser,
            @RequestParam(required = false) String userScript,
            @RequestParam String question,
            @RequestParam(required = false) LearningTestType learningTestType,
            Model model
    ) {

        Learning learning = new Learning();
        Long userId = loginUser.getId();
        String correctedScript = null;
        if (learningTestType == null) {
            correctedScript = writingService.talk(question, userScript, learning, userId);
        } else {
            correctedScript = speakingService.talk(learningTestType, question, userScript, learning, userId);
        }

        if (correctedScript.equals("retry")) {
            learningRepository.delete(learning.getId());
        }

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
    ) {
        String userScript = "";
        if (audio != null) {
            String directory = request.getServletContext().getRealPath("/WEB-INF/files");
            userScript = openAiClient.transcript(directory, audio);
        } else {
            userScript = text;
        }

        JSONObject json = new JSONObject();

        if (userScript.equals("")) { // user가 아무말도 하지 않았을 때
            json.put("profanity", false);
        } else {
            double profanityScore = perspectiveClient.getProfanityScore(userScript);
            json.put("profanity", Boolean.toString(profanityScore > 0.7));
        }
        json.put("userScript", userScript);
        return json.toString();
    }

    @ResponseBody
    @PostMapping("/learning/sentence/{sentenceId}/delete")
    public void toggleDelete(
            @PathVariable Long sentenceId
    ) {
        sentenceRepository.delete(sentenceId);
    }
}
