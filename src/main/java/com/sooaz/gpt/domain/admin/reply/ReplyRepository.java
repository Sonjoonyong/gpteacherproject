package com.sooaz.gpt.domain.admin.reply;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ReplyRepository {
     private final ReplyMapper replyMapper;
     public ReplyListDto replyInsert(ReplyListDto dto){
          replyMapper.replyInsert(dto);
          return dto;
     }
     public List<ReplyListDto> replyListSelect(@RequestParam("questionId")Long questionId){
          return replyMapper.replyListSelect(questionId);
     }

     public ReplyListDto replyUpdate(ReplyListDto dto){
          replyMapper.replyUpdate(dto);
          return dto;
     }

     public ReplyListDto replyDelete(ReplyListDto dto){
          replyMapper.replyDelete(dto);
          return dto;
     }
}
