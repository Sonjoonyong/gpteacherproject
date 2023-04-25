package com.sooaz.gpt.domain.community.communityreply;

import lombok.Data;

import java.util.Date;

@Data
public class CommunityReplyListDto {
    private Long id;
    private Long communityPostId;
    private Long user_id;
    private Date communityReplyWritedate;
    private String communityReplyContent;
    private Long communityReplyParentsId;
    private String userNickname;
}
