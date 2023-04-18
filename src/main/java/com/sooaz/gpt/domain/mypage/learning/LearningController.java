package com.sooaz.gpt.domain.mypage.learning;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@Slf4j
public class LearningController {

    private final LearningService learningService;

    @ResponseBody
    @PostMapping("/learning/{learningId}/like")
    public String toggleLike(
            @PathVariable Long learningId
    ) {
        return learningService.toggleLike(learningId);
    }

    @ResponseBody
    @PostMapping("/learning/{learningId}/delete")
    public void toggleDelete(
            @PathVariable Long learningId
    ) {
        learningService.toggleDelete(learningId);
    }

}
