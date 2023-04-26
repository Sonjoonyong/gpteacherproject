package com.sooaz.gpt.domain.mypage;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.community.Community;
import com.sooaz.gpt.domain.community.communityreply.MyReplyDto;
import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.mypage.flashcard.Flashcard;
import com.sooaz.gpt.domain.mypage.flashcard.FlashcardService;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningFindDto;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MypageController {

    private final MypageService mypageService;
    private final FlashcardService flashcardService;

    @GetMapping("/user/mypage/dashboard")
    public String getDashboard(
            @SessionAttribute User loginUser,
            Model model
    ) {
        LearningFindDto learningFindDto = new LearningFindDto();
        learningFindDto.setUserId(loginUser.getId());
        learningFindDto.setSortType("id_desc");
        List<Learning> learnings = mypageService.getLearningList(learningFindDto);
        if (learnings.size() >= 2) {
            model.addAttribute("learnings", learnings.subList(0, 2));
        } else {
            model.addAttribute("learnings", learnings);
        }

        // 잔디심기 데이터 넘겨주기
        JSONArray data = mypageService.getCalendarHeatmapData(loginUser.getId());
        model.addAttribute("data",data);
        return "mypage/learning/dashboard";
    }

    @GetMapping("/user/mypage/learnings")
    public String getMyLearnings(
            @SessionAttribute User loginUser,
            Model model
    ) {
        PageHelper.startPage(1, 5);

        LearningFindDto learningFindDto = new LearningFindDto();
        learningFindDto.setUserId(loginUser.getId());
        learningFindDto.setSortType("id_desc");
        List<Learning> learnings = mypageService.getLearningList(learningFindDto);

        PageInfo<Learning> pageInfo = new PageInfo<>(learnings);
        model.addAttribute("pageInfo",pageInfo);
        return "mypage/learning/learningHistory";
    }

    @PostMapping("/user/mypage/learnings")
    public String getSelectedLearnings(
            @SessionAttribute User loginUser,
            @RequestParam(defaultValue = "1") int pageNum,
            @RequestParam(required = false, defaultValue = "all") String learningType,
            @RequestParam(required = false, defaultValue = "id_desc") String sortType,
            @RequestParam(required = false, defaultValue = "0") Character onlyLike,
            Model model
    ) {
        PageHelper.startPage(pageNum, 5);
        LearningFindDto learningFindDto = new LearningFindDto();

        learningFindDto.setUserId(loginUser.getId());
        if (!learningType.equals("all")) {
            learningFindDto.setLearningType(LearningType.valueOf(learningType));
        }
        learningFindDto.setSortType(sortType);
        if(onlyLike != null && onlyLike.equals('1')) {
            learningFindDto.setOnlyLike(onlyLike);
        }
        List<Learning> learnings = mypageService.getLearningList(learningFindDto);
        PageInfo<Learning> pageInfo = new PageInfo<>(learnings);
        model.addAttribute("pageInfo",pageInfo);

        model.addAttribute("learningType", learningType);
        model.addAttribute("sortType", sortType);
        model.addAttribute("onlyLike", onlyLike);
        return "mypage/learning/learningHistory";
    }

    @GetMapping("/user/mypage/sentences")
    public String getMySentences(
            @SessionAttribute User loginUser,
            Model model
    ) {
        PageHelper.startPage(1, 5);

        LearningFindDto learningFindDto = new LearningFindDto();
        learningFindDto.setUserId(loginUser.getId());
        learningFindDto.setSortType("id_desc");
        List<Sentence> sentences = mypageService.getSentenceList(learningFindDto);

        PageInfo<Sentence> pageInfo = new PageInfo<>(sentences);
        model.addAttribute("pageInfo",pageInfo);
        return "mypage/learning/mySentences";
    }

    @PostMapping("/user/mypage/sentences")
    public String getSelectedSentences(
            @SessionAttribute User loginUser,
            @RequestParam(defaultValue = "1") int pageNum,
            @RequestParam(required = false) String learningType,
            @RequestParam(required = false) String sortType,
            @RequestParam(required = false) Character onlyLike,
            Model model
    ) {
        PageHelper.startPage(pageNum, 5);
        LearningFindDto learningFindDto = new LearningFindDto();

        learningFindDto.setUserId(loginUser.getId());
        if (!learningType.equals("all")) {
            learningFindDto.setLearningType(LearningType.valueOf(learningType));
        }
        learningFindDto.setSortType(sortType);
        if(onlyLike != null && onlyLike.equals('1')) {
            learningFindDto.setOnlyLike(onlyLike);
        }
        List<Sentence> sentences = mypageService.getSentenceList(learningFindDto);
        PageInfo<Sentence> pageInfo = new PageInfo<>(sentences);
        model.addAttribute("pageInfo", pageInfo);

        model.addAttribute("learningType", learningType);
        model.addAttribute("sortType", sortType);
        model.addAttribute("onlyLike", onlyLike);
        return "mypage/learning/mySentences";
    }

    @GetMapping("/user/mypage/flashcards")
    public String getFlashCardForm(
            @SessionAttribute User loginUser,
            Model model
    ) {
        PageHelper.startPage(1, 5);

        List<Flashcard> flashcards = flashcardService.getFlashcardList(loginUser.getId());

        PageInfo<Flashcard> pageInfo = new PageInfo<>(flashcards);
        model.addAttribute("pageInfo", pageInfo);
        return "mypage/learning/flashcard";
    }

    @PostMapping("/user/mypage/flashcards")
    public String flashcardResult() {
        return "";
    }

    // 나의 활동 -------------------------------------------
    @GetMapping("/user/mypage/communities")
    public String getMyCommunities(
            @SessionAttribute User loginUser,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
            Model model
    ) {
        PageHelper.startPage(pageNum, pageSize);
        List<Community> communities = mypageService.getPostList(loginUser.getId());
        PageInfo<Community> pageInfo = new PageInfo<>(communities);
        model.addAttribute("pageInfo", pageInfo);
        log.info("pageInfo = {}", pageInfo);
        return "mypage/activity/myPosts";
    }

    @PostMapping("/user/mypage/communities")
    public String deletePost(
            @SessionAttribute User loginUser,
            @RequestParam List<Long> deleteId
    ) {
        log.info("checkList = {}",deleteId);
        mypageService.deletePostsById(deleteId); //postId list, userId
        mypageService.deleteCommentsByPostId(deleteId);
        mypageService.deleteBookmarks(deleteId, loginUser.getId());
        return "redirect:/user/mypage/communities";
    }

    @GetMapping("/user/mypage/comments")
    public String getMyComments(
            @SessionAttribute User loginUser,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
            Model model
    ) {
        PageHelper.startPage(pageNum, pageSize);
        List<MyReplyDto> myReplyDtos = mypageService.getMyCommentList(loginUser.getId());
        PageInfo<MyReplyDto> pageInfo = new PageInfo<>(myReplyDtos);
        model.addAttribute("pageInfo",pageInfo);
        return "mypage/activity/myComments";
    }

    @PostMapping("/user/mypage/comments")
    public String deleteComments(
            @RequestParam List<Long> deleteId
    ) {
        log.info("checkList = {}",deleteId);
        mypageService.deleteCommentsById(deleteId); //commentId list, userId
        return "redirect:/user/mypage/comments";
    }

    @GetMapping("/user/mypage/bookmarks")
    public String getMyBookmarks(
            @SessionAttribute User loginUser,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
            Model model
    ) {
        PageHelper.startPage(pageNum, pageSize);
        List<Community> communities = mypageService.getBookmarkList(loginUser.getId());
        PageInfo<Community> pageInfo = new PageInfo<>(communities);
        model.addAttribute("pageInfo", pageInfo);
        return "mypage/activity/myBookmarks";
    }

    @PostMapping("/user/mypage/bookmarks")
    public String deleteBookmarks(
            @SessionAttribute User loginUser,
            @RequestParam List<Long> deleteId
    ) {
        log.info("checkList = {}",deleteId);
        mypageService.deleteBookmarks(deleteId, loginUser.getId()); //postId list, userId
        return "redirect:/user/mypage/bookmarks";
    }

}
