package com.sooaz.gpt.domain.community.like;

import lombok.Data;

@Data
public class Like {
    private Long communityPostId;
    private Long userId;
}
