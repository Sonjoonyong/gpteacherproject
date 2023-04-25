package com.sooaz.gpt.domain.community.communityreply;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface CommunityReplyMapper {
    CommunityReply findById(Long id);
    List<CommunityReply> findByUserId(Long userId);
    void save(CommunityReply communityReply);
    void update(CommunityReply communityReply);
    List<CommunityReply> findByCommunityPostId(Long communityPostId);

    void delete(Long communityReplyId);
}


