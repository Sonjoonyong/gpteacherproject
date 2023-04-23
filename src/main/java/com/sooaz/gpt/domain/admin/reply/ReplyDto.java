package com.sooaz.gpt.domain.admin.reply;

import lombok.Data;

import java.util.Date;

@Data
public class ReplyDto {
    private Long id;
    private Long userId;
    private Long questionId;
    private Date questionReplyWriteDate;
    private String questionReplyContent;
    private Long questionReplyParentId;
}
