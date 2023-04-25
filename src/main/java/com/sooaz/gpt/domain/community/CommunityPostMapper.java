package com.sooaz.gpt.domain.community;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommunityPostMapper {
    void save(CommunityPost communityPost);

    CommunityPost findById(Long communityPostId);

    List<CommunityPost> findAll(String search);

    List<CommunityPost> findByUserId(Long userId);

    List<CommunityPost> findBookmarksByUserId(Long userId);

    void update(CommunityPostUpdateDto communityPostUpdateDto);

    void delete(Long communityPostId);

}

