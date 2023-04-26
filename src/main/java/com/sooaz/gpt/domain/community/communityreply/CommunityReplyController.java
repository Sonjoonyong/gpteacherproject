package com.sooaz.gpt.domain.community.communityreply;


import com.sooaz.gpt.domain.admin.faq.Faq;
import com.sooaz.gpt.domain.admin.faq.FaqCreateDto;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CommunityReplyController {

    private final CommunityReplyService communityReplyService;

    @PostMapping("/community/{communityPostId}/reply")
    public String reply(
            @Valid @ModelAttribute CommunityReplyDto communityReplyDto,
            BindingResult bindingResult,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ) {
        if (bindingResult.hasErrors()) {
            return "community/postView";
        }

        Long postId = communityReplyDto.getCommunityPostId();
        String replyContent = communityReplyDto.getCommunityReplyContent();

        CommunityReply reply = new CommunityReply();
        reply.setCommunityPostId(postId);
        reply.setUserId(loginUser.getId());
        reply.setCommunityReplyContent(replyContent);
        communityReplyService.reply(reply);

        return "redirect:community/" + postId;
    }

    @GetMapping("/community/communityReplyList")
    public List<CommunityReplyListDto> getReplyList(
            @RequestParam Long communityPostId
    ) {
        List<CommunityReplyListDto> replyList = communityReplyService.findByCommunityPostId(communityPostId);
        for (CommunityReplyListDto communityReplyListDto : replyList) {
            log.info("communityReplyListDto = {}", communityReplyListDto);
        }

        return replyList;
    }


}


