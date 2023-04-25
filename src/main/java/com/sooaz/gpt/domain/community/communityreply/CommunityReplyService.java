package com.sooaz.gpt.domain.community.communityreply;

import com.sooaz.gpt.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommunityReplyService {
    private final CommunityReplyRepository communityReplyRepository;
    private final UserRepository userRepository;
}

