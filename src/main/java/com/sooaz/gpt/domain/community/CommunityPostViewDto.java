package com.sooaz.gpt.domain.community;

import lombok.Data;

import java.util.Date;

@Data
public class CommunityPostViewDto {
    private Long communityPostId;
    private Long userId;
    private Long sentenceId;
    private String userNickname;
    private String communityPostCategory;
    private String communityPostTitle;
    private String communityPostContent;
    private Long communityPostHit;
    private Date communityPostWritedate;
    private Long communityPostLike;
    private Boolean isBookmarked;
    private Boolean isLiked;
    private Long communityPostReplyCount;
}
