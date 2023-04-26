package com.sooaz.gpt.domain.community.communityreply;

import lombok.Data;

import java.util.Date;

@Data
public class CommunityReplyListDto {
    private Long communityReplyId;
    private Long communityPostId;
    private Long userId;
    private Date communityReplyWritedate;
    private String communityReplyContent;
    private Long communityReplyParentsId;
    private String userNickname;
    private Boolean isAdmin;
    private Boolean isWriter;
}
