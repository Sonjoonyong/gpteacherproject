package com.sooaz.gpt.domain.community.communityreply;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommunityReplyMapper {

    List<CommunityReply> findByUserId(Long userId);

    void delete(Long communityReplyId);
}
