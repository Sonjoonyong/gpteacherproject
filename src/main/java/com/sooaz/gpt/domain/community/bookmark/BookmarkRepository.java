package com.sooaz.gpt.domain.community.bookmark;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BookmarkRepository {

    private final BookmarkMapper bookmarkMapper;

    public void insert(Bookmark bookmark) {
        bookmarkMapper.insert(bookmark);
    }

    public void delete(Bookmark bookmark) {
        bookmarkMapper.delete(bookmark);
    }
}
