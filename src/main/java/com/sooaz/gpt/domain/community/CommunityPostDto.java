package com.sooaz.gpt.domain.community;

import lombok.Data;
//sub
@Data
public class CommunityPostDto {
    private Long userId;
    private String communityPostTitle;
    private String communityPostContent;
    private String communityPostCategory;

}

