package com.sooaz.gpt.domain.admin.reply;

import com.sooaz.gpt.domain.admin.reply.ReplyDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ReplyDao {
     private final ReplyMapper replyMapper;
     public ReplyDto replyInsert(ReplyDto dto){
          replyMapper.replyInsert(dto);
          return dto;
     }

}
