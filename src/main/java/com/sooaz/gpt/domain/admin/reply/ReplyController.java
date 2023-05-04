package com.sooaz.gpt.domain.admin.reply;

import com.sooaz.gpt.domain.community.communityreply.CommunityReplyListDto;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
@RequiredArgsConstructor
public class ReplyController {

    private final ReplyService replyService;

    @PostMapping("/replySend")
    public String replySend(
            ReplyListDto dto,
            HttpServletRequest request,
            @RequestParam("questionId") Long questionId
    ){
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        dto.setUserId(loginUser.getId());

        ReplyListDto result = replyService.replyInsert(dto);

        return result+"";
    }
    @ResponseBody
    @GetMapping("/help/replyList")
    public List<ReplyListDto> replyList(
            @RequestParam("questionId")Long questionId,
            @SessionAttribute(SessionConst.LOGIN_USER) User loginUser
    ){
        List<ReplyListDto> replyListDtos = replyService.replyListSelect(questionId);
        for (ReplyListDto dto : replyListDtos) {
            dto.setIsWriter(loginUser.getId().equals(dto.getUserId()));
            dto.setIsAdmin(loginUser.getUserRole().equals(UserRole.ADMIN));
        }
        return replyListDtos;
    }

    @PostMapping("/replyEdit")
    public String replyEdit(ReplyListDto dto, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        dto.setUserId(loginUser.getId());
        ReplyListDto result = replyService.replyUpdate(dto);
        return String.valueOf(result);
    }

    @GetMapping("/replyDelete")
    public String replyDelete(ReplyListDto dto, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        dto.setUserId(loginUser.getId());
        ReplyListDto result = replyService.replyDelete(dto);
        return String.valueOf(result);
    }


}
