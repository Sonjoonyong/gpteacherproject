package com.sooaz.gpt.domain.community.communityreply;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class CommunityReplyRepository {

    private final CommunityReplyMapper communityReplyMapper;

    public List<CommunityReply> findByUserId(Long userId) {
        return communityReplyMapper.findByUserId(userId);
    }

    public void delete(Long communityReplyId) {
        communityReplyMapper.delete(communityReplyId);
    }
}
