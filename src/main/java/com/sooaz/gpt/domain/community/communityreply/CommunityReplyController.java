package com.sooaz.gpt.domain.community.communityreply;


import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CommunityReplyController {

    private final CommunityReplyService communityReplyService;

    @PostMapping("/community/{communityPostId}/reply")
    public String reply(
            @Valid @ModelAttribute CommunityReplyDto communityReplyDto,
            BindingResult bindingResult,
            @PathVariable Long communityPostId,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        if (bindingResult.hasErrors()) {
            return "community/postView";
        }

        String replyContent = communityReplyDto.getCommunityReplyContent();

        CommunityReply reply = new CommunityReply();
        reply.setCommunityPostId(communityPostId);
        reply.setUserId(loginUser.getId());
        reply.setCommunityReplyContent(replyContent);
        communityReplyService.save(reply);

        return "redirect:/community/" + communityPostId;
    }

    @ResponseBody
    @GetMapping("/community/communityReplyList")
    public List<CommunityReplyListDto> getReplyList(
            @RequestParam Long communityPostId,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        List<CommunityReplyListDto> communityReplyListDtos = communityReplyService.findByCommunityPostId(communityPostId);
        for (CommunityReplyListDto dto : communityReplyListDtos) {
            dto.setIsWriter(loginUser.getId().equals(dto.getUserId()));
            dto.setIsAdmin(loginUser.getUserRole().equals(UserRole.ADMIN));
        }
        return communityReplyListDtos;
    }

    @ResponseBody
    @PostMapping("/community/reply/{communityReplyId}/delete")
    public String delete(
            @PathVariable Long communityReplyId,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser,
            RedirectAttributes redirectAttributes
    ) {
        CommunityReply reply =
                communityReplyService.findById(communityReplyId).orElse(null);

        if (reply == null
                || !loginUser.getUserRole().equals(UserRole.ADMIN)
                && !reply.getUserId().equals(loginUser.getId())
        ) {
            redirectAttributes.addFlashAttribute("message", "잘못된 접근입니다.");
            return "redirect:/community/list";
        }

        communityReplyService.delete(communityReplyId);
        return "reply deleted";
    }


}


