package com.sooaz.gpt.domain.community.communityreply;

import com.sooaz.gpt.domain.community.Community;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommunityReplyMapper {
    CommunityReply findById(Long Id);
    List<CommunityReply> findByUserId(Long userId);

    void update(CommunityReply communityReply);

    void save(CommunityReply communityReply);

    void delete(Long communityReplyId);
}
