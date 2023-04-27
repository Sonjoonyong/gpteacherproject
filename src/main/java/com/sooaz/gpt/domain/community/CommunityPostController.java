package com.sooaz.gpt.domain.community;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.community.bookmark.Bookmark;
import com.sooaz.gpt.domain.community.bookmark.BookmarkRepository;
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
@RequiredArgsConstructor //생성자를 자동 생성해줌
@RequestMapping("/community")
@Slf4j
public class CommunityPostController {

    private final CommunityPostService communityPostService;
    private final BookmarkRepository bookmarkRepository;

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
            RedirectAttributes redirectAttributes,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        log.info("Dto={}", communityPostDto);

        communityPostDto.setUserId(loginUser.getId());
        communityPostService.save(communityPostDto);
        redirectAttributes.addFlashAttribute("message", "게시글이 등록되었습니다.");
        return "redirect:/community/list";
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

        model.addAttribute("communityPostUpdateDto", updateDto);
        return "community/postEdit";
    }

    @PostMapping("/{communityPostId}/edit")
    public String edit(
            @ModelAttribute CommunityPostUpdateDto communityPostUpdateDto
        ) {
        log.info("communityPostUpdateDto = {}", communityPostUpdateDto);
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
}
