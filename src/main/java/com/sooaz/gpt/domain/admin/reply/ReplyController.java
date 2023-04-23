package com.sooaz.gpt.domain.admin.reply;

import com.sooaz.gpt.domain.user.User;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@RestController
@RequiredArgsConstructor
public class ReplyController {

    private final ReplyService replyService;

    @PostMapping("/replySend")
    public String replySend(ReplyDto dto, HttpServletRequest request,@RequestParam("questionId") Long questionId){
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        dto.setUserId(loginUser.getId());

        ReplyDto result = replyService.replyInsert(dto);

        return result+"";
    }

}
