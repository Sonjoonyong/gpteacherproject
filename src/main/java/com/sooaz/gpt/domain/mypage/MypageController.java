package com.sooaz.gpt.domain.mypage;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.community.Community;
import com.sooaz.gpt.domain.community.communityreply.MyReplyDto;
import com.sooaz.gpt.domain.learning.LearningType;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningFindDto;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import com.sooaz.gpt.domain.user.UserService;
import com.sooaz.gpt.global.constant.SessionConst;
import com.sooaz.gpt.global.security.PasswordHasher;
import com.sooaz.gpt.global.security.SecurityConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MypageController {

    private final MypageService mypageService;
    private final PasswordHasher passwordHasher;
    private final UserService userService;


    @GetMapping("/user/mypage/dashboard")
    public String getDashboard(
            Model model
    ) {
        LearningFindDto learningFindDto = new LearningFindDto();
        learningFindDto.setUserId(1L);
        learningFindDto.setSortType("id_desc");
        List<Learning> learnings = mypageService.getLearningList(learningFindDto);
        model.addAttribute("learnings", learnings.subList(0,2));
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
        learningFindDto.setSortType(sortType);
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
        learningFindDto.setSortType(sortType);
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

    @ResponseBody
    @PostMapping("/user/mypage/withdraw")
    public String withdraw(
            @RequestParam String userPassword,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser,
            HttpServletRequest request
    ) {
        log.info("userPassword = {}", userPassword);

        if (loginUser == null) {
            return "false";
        }

        if (loginUser.getUserRole() == UserRole.ADMIN) {
            return "false";
        }

        String hashedPassword = passwordHasher.hash(
                userPassword,
                loginUser.getUserPasswordSalt()
        );

        if (loginUser.getUserPassword().equals(hashedPassword)) {
            userService.delete(loginUser.getId());
            log.info("회원 탈퇴: loginUser = {}", loginUser);
            request.getSession().invalidate();
            return "true";
        }

        return "false";
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

    // 나의 활동 -------------------------------------------
    @GetMapping("/user/mypage/communities")
    public String getMyCommunities(
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
            Model model
    ) {
        PageHelper.startPage(pageNum, pageSize);
        List<Community> communities = mypageService.getPostList(1L); //임시 user id
        PageInfo<Community> pageInfo = new PageInfo<>(communities);
        model.addAttribute("pageInfo", pageInfo);
        return "mypage/activity/myPosts";
    }

    @PostMapping("/user/mypage/communities")
    public String deletePost(
            @RequestParam List<Long> deleteId
    ) {
        log.info("checkList = {}",deleteId);
        mypageService.deletePostsById(deleteId); //postId list, userId
        return "redirect:/user/mypage/communities";
    }

    @GetMapping("/user/mypage/comments")
    public String getMyComments(
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
            Model model
    ) {
        PageHelper.startPage(pageNum, pageSize);
        List<MyReplyDto> myReplyDtos = mypageService.getMyCommentList(1L); //임시 user id
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
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
            Model model
    ) {
        PageHelper.startPage(pageNum, pageSize);
        List<Community> communities = mypageService.getBookmarkList(1L); //임시 user id
        PageInfo<Community> pageInfo = new PageInfo<>(communities);
        model.addAttribute("pageInfo", pageInfo);
        return "mypage/activity/myBookmarks";
    }

    @PostMapping("/user/mypage/bookmarks")
    public String deleteBookmarks(
            @RequestParam List<Long> deleteId
    ) {
        log.info("checkList = {}",deleteId);
        mypageService.deleteBookmarks(deleteId, 1L); //postId list, userId
        return "redirect:/user/mypage/bookmarks";
    }

}
