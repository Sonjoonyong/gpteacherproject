package com.sooaz.gpt.domain.community.communityreply;

import lombok.Data;

@Data
public class CommunityReplyUpdateDto {
    private Long communityReplyId;
    private String communityReplyContent;
}
