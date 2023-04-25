package com.sooaz.gpt.domain.community.communityreply;

import lombok.Data;

import java.util.Date;

@Data
public class CommunityReply {
    private Long id;
    private Long userId;
    private Long communityPostId;
    private Date communityReplyWritedate;
    private String communityReplyContent;
    private Long communityReplyParentsId;
}

