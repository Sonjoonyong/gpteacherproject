package com.sooaz.gpt.domain.community.bookmark;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Optional;

@Mapper
public interface BookmarkMapper {

    void save(@Param("communityPostId") Long communityPostId,
              @Param("userId") Long userId);

    Optional<Bookmark> findById(@Param("communityPostId") Long communityPostId,
                               @Param("userId") Long userId);

    void delete(Bookmark bookmark);
}
