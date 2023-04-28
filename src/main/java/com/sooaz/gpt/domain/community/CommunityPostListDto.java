package com.sooaz.gpt.domain.community;

import lombok.Data;

import java.util.Date;

@Data
public class CommunityPostListDto {
    private Long id;
    private Long userId;
    private String userNickname;
    private String communityPostCategory;
    private String communityPostTitle;
    private String communityPostContent;
    private Long communityPostHit;
    private Date communityPostWritedate;
    private Long communityPostLike;
    private Long communityPostReplyCount;
}
