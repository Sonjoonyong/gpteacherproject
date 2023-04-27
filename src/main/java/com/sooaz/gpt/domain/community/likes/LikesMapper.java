package com.sooaz.gpt.domain.community.likes;

import com.sooaz.gpt.domain.community.bookmark.Bookmark;

public interface LikesMapper {

    void insert(Likes likes);
    void delete(Likes likes);
}
