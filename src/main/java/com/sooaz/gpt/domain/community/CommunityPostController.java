package com.sooaz.gpt.domain.community;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.community.bookmark.Bookmark;
import com.sooaz.gpt.domain.community.bookmark.BookmarkRepository;
import com.sooaz.gpt.domain.community.like.Like;
import com.sooaz.gpt.domain.community.like.LikeRepository;
import com.sooaz.gpt.domain.mypage.learning.Learning;
import com.sooaz.gpt.domain.mypage.learning.LearningRepository;
import com.sooaz.gpt.domain.mypage.learning.LearningService;
import com.sooaz.gpt.domain.mypage.sentence.Sentence;
import com.sooaz.gpt.domain.mypage.sentence.SentenceRepository;
import com.sooaz.gpt.domain.mypage.sentence.SentenceService;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
@Slf4j
public class CommunityPostController {

    private final CommunityPostService communityPostService;
    private final BookmarkRepository bookmarkRepository;
    private final LikeRepository likeRepository;
    private final SentenceRepository sentenceRepository;
    private final LearningRepository learningRepository;

    @GetMapping("/list")
    public String getList(
        @RequestParam(defaultValue = "1") int pageNum,
        @RequestParam(defaultValue = "12") int pageSize,
        @RequestParam(required = false) String search,
        Model model,
        HttpServletRequest request
    ) {
        Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
        if (flashMap != null) {
            model.addAttribute("message", flashMap.get("message"));
        }

        PageHelper.startPage(pageNum, pageSize);
        List<CommunityPostListDto> communityPost = communityPostService.findAll(search);
        PageInfo<CommunityPostListDto> pageInfo = new PageInfo<>(communityPost);
        model.addAttribute("pageInfo", pageInfo);
        return "community/postList";
    }


    @GetMapping("/{communityPostId}")
    public String view(
            @PathVariable Long communityPostId,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser,
            Model model
    ) {
        CommunityPostViewDto communityPostViewDto =
                communityPostService
                        .findByIdForView(communityPostId, loginUser.getId())
                        .orElse(null);

        // 본인 글이 아닐 시 조회수 증가
        if (!communityPostViewDto.getUserId().equals(loginUser.getId())) {
            Long hit = communityPostViewDto.getCommunityPostHit() + 1;
            communityPostViewDto.setCommunityPostHit(hit);

            CommunityPostUpdateDto updateDto = new CommunityPostUpdateDto();
            updateDto.setCommunityPostId(communityPostId);
            updateDto.setCommunityPostHit(hit);
            communityPostService.update(updateDto);
        }

        Long sentenceId = communityPostViewDto.getSentenceId();
        if (sentenceId != null) {
            Optional<Sentence> sentenceOpt = sentenceRepository.findById(sentenceId);
            sentenceOpt.ifPresent(sentence -> model.addAttribute("sentence", sentence));
        }

        communityPostViewDto.setCommunityPostContent(
                communityPostViewDto.getCommunityPostContent().replace("\"", "\\\"")
        );

        model.addAttribute("communityPostViewDto", communityPostViewDto);
        model.addAttribute(SessionConst.LOGIN_USER, loginUser);
        return "community/postView";
    }

    @GetMapping("/write")
    public String getWriteForm(Model model) {
        model.addAttribute("communityPostDto", new CommunityPostDto());
        return "community/postNew";
    }

    @PostMapping("/write")
    public String post(
            @ModelAttribute CommunityPostDto communityPostDto,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser,
            RedirectAttributes redirectAttributes
    ) {
        log.info("Dto={}", communityPostDto);

        communityPostDto.setUserId(loginUser.getId());

        // 본인 문장인지 확인
        if (!isOwnSentence(communityPostDto.getSentenceId(), loginUser)) {
            redirectAttributes.addFlashAttribute("message", "잘못된 접근입니다.");
            return "redirect:/community/list";
        }

        CommunityPost savedPost = communityPostService.save(communityPostDto);

        return "redirect:/community/" + savedPost.getId();
    }

    @GetMapping("/{communityPostId}/edit")
    public String getEditForm(
            @PathVariable Long communityPostId,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        Optional<CommunityPost> postOpt = communityPostService.findById(communityPostId);
        if (postOpt.isEmpty() || !postOpt.get().getUserId().equals(loginUser.getId())) {
            redirectAttributes.addFlashAttribute("message", "잘못된 접근입니다.");
            return "redirect:/community/list";
        }

        CommunityPost post = postOpt.get();
        CommunityPostUpdateDto updateDto = new CommunityPostUpdateDto();
        updateDto.setCommunityPostId(post.getId());
        updateDto.setCommunityPostTitle(post.getCommunityPostTitle());
        updateDto.setCommunityPostContent(post.getCommunityPostContent());
        updateDto.setCommunityPostCategory(post.getCommunityPostCategory());

        Long sentenceId = post.getSentenceId();
        if (sentenceId != null) {
            Optional<Sentence> sentenceOpt = sentenceRepository.findById(sentenceId);
            sentenceOpt.ifPresent(sentence -> model.addAttribute("sentence", sentence));
        }

        model.addAttribute("communityPostUpdateDto", updateDto);
        return "community/postEdit";
    }

    @PostMapping("/{communityPostId}/edit")
    public String edit(
            @ModelAttribute CommunityPostUpdateDto communityPostUpdateDto,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser,
            RedirectAttributes redirectAttributes
        ) {
        log.info("communityPostUpdateDto = {}", communityPostUpdateDto);

        // 본인 문장인지 확인
        if (!isOwnSentence(communityPostUpdateDto.getSentenceId(), loginUser)) {
            redirectAttributes.addFlashAttribute("message", "잘못된 접근입니다.");
            return "redirect:/community/list";
        }

        communityPostService.update(communityPostUpdateDto);
        return "redirect:/community/" + communityPostUpdateDto.getCommunityPostId();
    }

    @PostMapping("/{communityPostId}/delete")
    public String delete(
            @PathVariable Long communityPostId,
            RedirectAttributes redirectAttributes,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        Optional<CommunityPost> postOpt = communityPostService.findById(communityPostId);
        if (postOpt.isEmpty() || !postOpt.get().getUserId().equals(loginUser.getId())) {
            redirectAttributes.addFlashAttribute("message", "잘못된 접근입니다.");
            return "redirect:/community/list";
        }
        communityPostService.delete(communityPostId);
        redirectAttributes.addFlashAttribute("message", "게시글이 삭제되었습니다.");
        return "redirect:/community/list";
    }

    @ResponseBody
    @PostMapping("/{communityPostId}/like")
    public String toggleLike(
            @PathVariable Long communityPostId,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        log.info("communityPostId = {}", communityPostId);

        Optional<Like> likeOpt =
                likeRepository.findById(communityPostId, loginUser.getId());

        CommunityPostUpdateDto updateDto = new CommunityPostUpdateDto();
        updateDto.setCommunityPostId(communityPostId);

        if (likeOpt.isEmpty()) {
            likeRepository.save(communityPostId, loginUser.getId());

            updateDto.setCommunityPostLikeChange(1L);
            communityPostService.update(updateDto);
            return "1";
        } else {
            Like like = new Like();
            like.setCommunityPostId(communityPostId);
            like.setUserId(loginUser.getId());
            likeRepository.delete(like);

            updateDto.setCommunityPostLikeChange(-1L);
            communityPostService.update(updateDto);
            return "0";
        }
    }

    @ResponseBody
    @PostMapping("/{communityPostId}/bookmark")
    public String toggleBookmark(
            @PathVariable Long communityPostId,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        log.info("communityPostId = {}", communityPostId);

        Optional<Bookmark> bookmarkOpt =
                bookmarkRepository.findById(communityPostId, loginUser.getId());

        if (bookmarkOpt.isEmpty()) {
            bookmarkRepository.save(communityPostId, loginUser.getId());
            return "1";
        } else {
            Bookmark bookmark = new Bookmark();
            bookmark.setCommunityPostId(communityPostId);
            bookmark.setUserId(loginUser.getId());
            bookmarkRepository.delete(bookmark);
            return "0";
        }
    }

    public boolean isOwnSentence(Long sentenceId, User loginUser) {
        if (sentenceId != null) {
            Optional<Sentence> sentenceOpt = sentenceRepository.findById(sentenceId);
            if (sentenceOpt.isEmpty()) {
                return false;
            }

            Sentence sentence = sentenceOpt.get();
            Long learningId = sentence.getLearningId();
            Optional<Learning> learningOpt = learningRepository.findById(learningId);

            if (learningOpt.isEmpty()) {
                return false;
            }

            Learning learning = learningOpt.get();
            Long userId = learning.getUserId();

            if (!loginUser.getId().equals(userId)) {
                return false;
            }
        }
        return true;
    }

    @GetMapping("/list/weekly")
    public String bestListAll( Model model) {
        model.addAttribute("bestListAll",communityPostService.bestListAll());
        return "community/bestList";
    }

}
