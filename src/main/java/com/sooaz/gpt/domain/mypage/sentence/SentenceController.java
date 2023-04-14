package com.sooaz.gpt.domain.mypage.sentence;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class SentenceController {

    private final SentenceRepository sentenceRepository;

    @GetMapping("/learning/sentences")
    public String getSentenceCorrection(
            @RequestParam Long learningId,
            Model model
    ) {
        List<Sentence> sentences = sentenceRepository.findAllByLearningId(learningId);

        model.addAttribute("sentences", sentences);

        return "learning/sentenceCorrection";
    }
}
