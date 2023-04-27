package com.sooaz.gpt.domain.community.likes;

import com.sooaz.gpt.domain.community.bookmark.Bookmark;
import com.sooaz.gpt.domain.community.bookmark.BookmarkMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class LikesRepository {
    private final LikesMapper likesMapper;

    public void insert(Likes likes) {
        likesMapper.insert(likes);
    }

    public void delete(Likes likes) {
        likesMapper.delete(likes);
    }
}

