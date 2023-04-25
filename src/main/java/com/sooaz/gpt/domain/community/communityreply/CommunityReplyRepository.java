package com.sooaz.gpt.domain.community.communityreply;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class CommunityReplyRepository {

    private final CommunityReplyMapper communityReplyMapper;

//    public CommunityReply insert(CommunityReply communityReply) {
//        if (communityReply.getId() == null) {
//            communityReplyMapper.save(communityReply);
//        } else {
////            communityReplyMapper.update(communityReply);
//        }
//        return communityReply;
//    }

    public CommunityReply replyInsert(CommunityReply communityreply){
        communityReplyMapper.replyInsert(communityreply);
        return communityreply;
    }
    public Optional<CommunityReply> findById(Long id) {
        return Optional.ofNullable(communityReplyMapper.findById(id));
    }
    public List<CommunityReply> findByUserId(Long userId) {
        return communityReplyMapper.findByUserId(userId);
    }

    public void deleteById(Long Id) {
        communityReplyMapper.delete(Id);
    }
//    (Long communityReplyId) {
//        communityReplyMapper.delete(communityReplyId);
//    } 위에를 이걸로 대체할 수 있다
}
