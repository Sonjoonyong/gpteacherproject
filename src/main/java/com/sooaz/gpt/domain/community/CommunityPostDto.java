package com.sooaz.gpt.domain.community;

import lombok.Data;
//sub
@Data
public class CommunityPostDto {
    private Long userId;
    private String communityTitle;
    private String communityContent;
    private String communityPostCategory;
    private String communityPassword;

}

