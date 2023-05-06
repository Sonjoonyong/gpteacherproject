package com.sooaz.gpt.domain.community.communityreply;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Mapper
public interface CommunityReplyMapper {
    void save(CommunityReply communityReply);

    Optional<CommunityReply> findById(Long communityReplyId);

    List<CommunityReplyListDto> findByCommunityPostId(Long communityPostId);

    List<MyReplyDto> findByUserId(Long userId);

    void update(CommunityReplyUpdateDto communityReplyUpdateDto);

    void delete(Long communityReplyId);

    void deleteByPostId(Long communityPostId);
}


