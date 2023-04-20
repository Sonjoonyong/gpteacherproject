package com.sooaz.gpt.domain.community;

import lombok.Data;

@Data
public class CommunityPostDto {
    private Long userId;
    private String communityTitle;
    private String communityContent;


}
