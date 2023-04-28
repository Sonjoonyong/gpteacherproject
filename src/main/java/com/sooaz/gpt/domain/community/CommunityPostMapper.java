package com.sooaz.gpt.domain.community;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface CommunityPostMapper {
    void save(CommunityPost communityPost);

    Optional<CommunityPost> findById(Long communityPostId);

    Optional<CommunityPostViewDto> findByIdForView(@Param("communityPostId") Long communityPostId, @Param("userId") Long userId);

    List<CommunityPostListDto> findAll(String search);

    List<CommunityPost> findByUserId(Long userId);

    List<CommunityPost> findBookmarksByUserId(Long userId);

    void update(CommunityPostUpdateDto communityPostUpdateDto);

    void delete(Long communityPostId);

}

