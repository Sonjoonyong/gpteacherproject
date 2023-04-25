package com.sooaz.gpt.domain.community.communityreply;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface CommunityReplyMapper {
    void save(CommunityReply communityReply);

    CommunityReply findById(Long id);

    List<CommunityReplyListDto> findByCommunityPostId(Long communityPostId);

    List<CommunityReply> findByUserId(Long userId);

    void update(CommunityReplyUpdateDto communityReplyUpdateDto);

    void delete(Long communityReplyId);
}


