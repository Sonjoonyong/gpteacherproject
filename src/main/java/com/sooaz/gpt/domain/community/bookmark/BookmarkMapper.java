package com.sooaz.gpt.domain.community.bookmark;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookmarkMapper {

    void delete(Bookmark bookmark);
}
