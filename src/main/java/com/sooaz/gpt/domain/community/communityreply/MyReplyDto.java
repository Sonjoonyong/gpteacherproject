package com.sooaz.gpt.domain.community.communityreply;

import lombok.Data;

import java.util.Date;

@Data
public class MyReplyDto {
    private Long id;
    private Long communityPostId;
    private String communityPostTitle;
    private String communityReplyContent;
    private Date communityReplyWritedate;
}
