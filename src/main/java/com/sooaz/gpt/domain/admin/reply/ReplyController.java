package com.sooaz.gpt.domain.admin.reply;

import com.sooaz.gpt.domain.user.User;
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
    public String replySend(ReplyListDto dto, HttpServletRequest request, @RequestParam("questionId") Long questionId){
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        dto.setUserId(loginUser.getId());

        ReplyListDto result = replyService.replyInsert(dto);

        return result+"";
    }

    @GetMapping("/help/replyList")
    public List<ReplyListDto> replyList(@RequestParam("questionId")Long questionId){
        return replyService.replyListSelect(questionId);
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
