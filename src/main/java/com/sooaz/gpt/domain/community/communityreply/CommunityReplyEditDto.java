package com.sooaz.gpt.domain.community.communityreply;

import lombok.Data;

@Data
public class CommunityReplyEditDto {
    private Long communityReplyId;
    private Long sentenceId;
    private String communityReplyContent;
}
