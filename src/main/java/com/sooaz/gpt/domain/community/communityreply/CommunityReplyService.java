package com.sooaz.gpt.domain.community.communityreply;

import com.sooaz.gpt.domain.community.CommunityPostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommunityReplyService {
    private final CommunityPostRepository communityPostRepository;
}
