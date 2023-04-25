package com.sooaz.gpt.domain.admin.reply;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReplyService {
    private final ReplyRepository dao;

    public ReplyListDto replyInsert(ReplyListDto dto){
        return dao.replyInsert(dto);
    }

    public List<ReplyListDto> replyListSelect(@RequestParam("questionId")Long questionId){
        return dao.replyListSelect(questionId);
    }

    public ReplyListDto replyUpdate(ReplyListDto dto){
        return dao.replyUpdate(dto);
    }

    public ReplyListDto replyDelete(ReplyListDto dto){
        return dao.replyDelete(dto);
    }
}
