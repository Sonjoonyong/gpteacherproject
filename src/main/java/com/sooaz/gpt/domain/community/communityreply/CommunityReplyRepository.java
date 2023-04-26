package com.sooaz.gpt.domain.community.communityreply;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class CommunityReplyRepository {

    private final CommunityReplyMapper communityReplyMapper;

    public CommunityReply save(CommunityReply communityreply) {
        communityReplyMapper.save(communityreply);
        return communityreply;
    }

    public Optional<CommunityReply> findById(Long communityReplyId) {
        return communityReplyMapper.findById(communityReplyId);
    }

    public List<CommunityReply> findByUserId(Long userId) {
        return communityReplyMapper.findByUserId(userId);
    }

    public void delete(Long communityReplyId) {
        communityReplyMapper.delete(communityReplyId);
    }

    public List<CommunityReplyListDto> findByCommunityPostId(Long communityPostId) {
        return communityReplyMapper.findByCommunityPostId(communityPostId);
    }

    public void update(CommunityReplyUpdateDto communityReplyUpdateDto) {
        communityReplyMapper.update(communityReplyUpdateDto);
    }
}
