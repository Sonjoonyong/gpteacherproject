package com.sooaz.gpt.domain.community.communityreply;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class CommunityReplyDto {
    @NotBlank
    private String communityReplyContent;
}
