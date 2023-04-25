package com.sooaz.gpt.domain.community;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor //생성자를 자동 생성해줌
@RequestMapping("/community")
@Slf4j
public class CommunityPostController {

    private final CommunityPostService communityPostService;

    @GetMapping("/list")
    public String getCommunity(
        @RequestParam(defaultValue = "1") int pageNum,
        @RequestParam(defaultValue = "12") int pageSize,
        @RequestParam(required = false) String search,
        Model model
    ) {
        PageHelper.startPage(pageNum, pageSize);
        List<CommunityPost> communityPost = communityPostService.findAll(search);
        PageInfo<CommunityPost> pageInfo = new PageInfo<>(communityPost);
        model.addAttribute("pageInfo", pageInfo);
        return "community/postList";
    }


    @GetMapping("/{communityPostId}")
    public String getCommunityById(
            @PathVariable Long communityPostId,
            Model model
    ) {
        CommunityPostViewDto communityPostViewDto =
                communityPostService.findByIdForView(communityPostId).orElse(null);
        log.info("communityPostViewDto = {}", communityPostViewDto);

        model.addAttribute("communityPostViewDto", communityPostViewDto);
        return "community/postView";
    }

    @GetMapping("/write")
    public String showCommunityWritePage(Model model) {
        model.addAttribute("communityPostDto", new CommunityPostDto());
        return "community/postNew";
    }

    @PostMapping("/write")
    public String postCommunity(
            @ModelAttribute CommunityPostDto communityPostDto,
            RedirectAttributes redirectAttributes,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        log.info("Dto={}", communityPostDto);

        communityPostDto.setUserId(loginUser.getId());
        communityPostService.post(communityPostDto);
        redirectAttributes.addFlashAttribute("message", "게시글이 등록되었습니다.");
        return "redirect:/community/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<CommunityPost> communityPost = communityPostService.findById(id);
        model.addAttribute("community", communityPost);
        return "community/postEdit";
    }

    @PostMapping("/delete/{id}")
    public String deleteCommunity(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        communityPostService.deleteCommunity(id);
        redirectAttributes.addFlashAttribute("message", "게시글이 삭제되었습니다.");
        return "redirect:/community/list";
    }
}
