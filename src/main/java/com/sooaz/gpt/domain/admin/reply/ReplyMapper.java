package com.sooaz.gpt.domain.admin.reply;

import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface ReplyMapper {

    void replyInsert(ReplyListDto dto);

    List<ReplyListDto> replyListSelect(@RequestParam("questionId")Long questionId);

    void replyUpdate(ReplyListDto dto);

    void replyDelete(ReplyListDto dto);
}
