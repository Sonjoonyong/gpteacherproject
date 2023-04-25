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

    public Optional<CommunityReply> findById(Long id) {
        return Optional.ofNullable(communityReplyMapper.findById(id));
    }

    public List<CommunityReply> findByUserId(Long userId) {
        return communityReplyMapper.findByUserId(userId);
    }

    public void delete(Long Id) {
        communityReplyMapper.delete(Id);
    }

    public List<CommunityReplyListDto> findByCommunityPostId(Long communityPostId) {
        return communityReplyMapper.findByCommunityPostId(communityPostId);
    }

    public void update(CommunityReplyUpdateDto communityReplyUpdateDto) {
        communityReplyMapper.update(communityReplyUpdateDto);
    }
}
