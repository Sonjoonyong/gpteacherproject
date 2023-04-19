package com.sooaz.gpt.domain.mypage;

import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningFindDto;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MypageController {

    private final MypageService mypageService;


    @GetMapping("/user/mypage/dashboard")
    public String getDashboard() {
        return "mypage/learning/dashboard";
    }

    @GetMapping("/user/mypage/learnings")
    public String getMyLearnings(
            Model model
    ) {
        LearningFindDto learningFindDto = new LearningFindDto();
        learningFindDto.setUserId(1L);
        List<Learning> learnings = mypageService.getLearningList(learningFindDto);
        model.addAttribute("learnings", learnings);
        return "mypage/learning/learningHistory";
    }

    @PostMapping("/user/mypage/learnings")
    public String getSelectedLearnings(
            @RequestParam(required = false) String learningType,
            @RequestParam(required = false) String sortType,
            @RequestParam(required = false) Character onlyLike,
            Model model
    ) {
        LearningFindDto learningFindDto = new LearningFindDto();

        learningFindDto.setUserId(1L);
        if (!learningType.equals("all")) {
            learningFindDto.setLearningType(LearningType.valueOf(learningType));
        }
        learningFindDto.setOrderBy(sortType);
        if(onlyLike != null && onlyLike.equals('1')) {
            learningFindDto.setOnlyLike(onlyLike);
        }
        //log.info("res = {}",learningFindDto);
        List<Learning> learnings = mypageService.getLearningList(learningFindDto);
        model.addAttribute("learnings", learnings);
        model.addAttribute("learningType", learningType);
        model.addAttribute("sortType", sortType);
        model.addAttribute("onlyLike", onlyLike);
        return "mypage/learning/learningHistory";
    }

    @GetMapping("/user/mypage/sentences")
    public String getMySentences(
            Model model
    ) {
        LearningFindDto learningFindDto = new LearningFindDto();
        learningFindDto.setUserId(1L);
        List<Sentence> sentences = mypageService.getSentenceList(learningFindDto);
        model.addAttribute("sentences", sentences);
        return "mypage/learning/mySentences";
    }

    @PostMapping("/user/mypage/sentences")
    public String getSelectedSentences(
            @RequestParam(required = false) String learningType,
            @RequestParam(required = false) String sortType,
            @RequestParam(required = false) Character onlyLike,
            Model model
    ) {
        LearningFindDto learningFindDto = new LearningFindDto();

        learningFindDto.setUserId(1L);
        if (!learningType.equals("all")) {
            learningFindDto.setLearningType(LearningType.valueOf(learningType));
        }
        learningFindDto.setOrderBy(sortType);
        if(onlyLike != null && onlyLike.equals('1')) {
            learningFindDto.setOnlyLike(onlyLike);
        }
        //log.info("res = {}",learningFindDto);
        List<Sentence> sentences = mypageService.getSentenceList(learningFindDto);
        model.addAttribute("sentences", sentences);
        model.addAttribute("learningType", learningType);
        model.addAttribute("sortType", sortType);
        model.addAttribute("onlyLike", onlyLike);
        return "mypage/learning/mySentences";
    }

    @GetMapping("/user/mypage/flashcards")
    public String getFlashCardForm() {
        return "mypage/learning/flashcard";
    }

    @PostMapping("/user/mypage/flashcards")
    public String flashcardResult() {
        return "";
    }

    @GetMapping("/user/mypage/withdraw")
    public String getWithdrawForm() {
        return "mypage/account/withdraw";
    }

    @PostMapping("/user/mypage/withdraw")
    public String withdraw() {
        return "";
    }

    @GetMapping("/user/mypage/edit")
    public String getUserEditForm() {
        return "mypage/account/editUserInfo";
    }

    @PostMapping("/user/mypage/edit")
    public String userEdit() {
        return "";
    }

    @GetMapping("/user/mypage/pwdEdit")
    public String getChangePwdForm() {
        return "mypage/account/changePassword";
    }

    @GetMapping("/user/mypage/communities")
    public String getMyCommunities() {
        return "mypage/activity/myPosts";
    }

    @GetMapping("/user/mypage/comments")
    public String getMyComments() {
        return "mypage/activity/myComments";
    }

    @GetMapping("/user/mypage/bookmarks")
    public String getMyBookmarks() {
        return "mypage/activity/myBookmarks";
    }

}
