package com.sooaz.gpt.domain.community.communityreply;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CommunityReplyService {

    private final CommunityReplyRepository communityReplyRepository;

    public CommunityReply save(CommunityReply communityReply) {
        communityReplyRepository.save(communityReply);
        return communityReply;
    }

    public Optional<CommunityReply> findById(Long communityReplyId) {
        return communityReplyRepository.findById(communityReplyId);
    }

    public List<MyReplyDto> findByUserId(Long userId) {
        return communityReplyRepository.findByUserId(userId);
    }

    public void delete(Long communityReplyId) {
        communityReplyRepository.delete(communityReplyId);
    }

    public void update(CommunityReplyUpdateDto updateDto) {
        communityReplyRepository.update(updateDto);
    }

    public List<CommunityReplyListDto> findByCommunityPostId(Long communityPostId) {
        return communityReplyRepository.findByCommunityPostId(communityPostId);
    }
}

