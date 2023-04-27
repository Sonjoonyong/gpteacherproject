package com.sooaz.gpt.domain.community.like;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Optional;

@Mapper
public interface LikeMapper {

    void save(@Param("communityPostId") Long communityPostId,
              @Param("userId") Long userId);

    Optional<Like> findById(@Param("communityPostId") Long communityPostId,
                                @Param("userId") Long userId);

    void delete(Like like);
}
