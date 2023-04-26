package com.sooaz.gpt.domain.community;

import lombok.Data;

@Data
public class CommunityPostUpdateDto {

    private Long communityPostId;
    private String communityPostTitle;
    private String communityPostContent;
    private String communityPostHit;
    private String communityPostLike;
    private String communityPostCategory;
}
