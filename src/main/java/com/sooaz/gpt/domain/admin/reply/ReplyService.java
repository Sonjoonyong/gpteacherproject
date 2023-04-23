package com.sooaz.gpt.domain.admin.reply;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ReplyService {
    private final ReplyDao dao;

    public ReplyDto replyInsert(ReplyDto dto){
        return dao.replyInsert(dto);
    }

}
