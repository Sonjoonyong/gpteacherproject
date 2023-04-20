package com.sooaz.gpt.domain.community;

import lombok.Data;

import java.util.Date;

@Data
public class CommunityUpdateDto {
    private Long id;
    private Long userId;
    private String communityPostCategory;
    private String communityTitle;
    private String communityContent;
    private Integer communityPostHit;
    private Date communityPostWirtedate;
    private Boolean communityPostLike;
}
