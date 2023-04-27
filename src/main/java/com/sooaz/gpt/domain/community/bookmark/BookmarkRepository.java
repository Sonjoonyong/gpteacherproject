package com.sooaz.gpt.domain.community.bookmark;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.awt.print.Book;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class BookmarkRepository {

    private final BookmarkMapper bookmarkMapper;

    public void save(Long communityPostId, Long userId) {
        bookmarkMapper.save(communityPostId, userId);
    }

    public Optional<Bookmark> findById(Long communityPostId, Long userId) {
        return bookmarkMapper.findById(communityPostId, userId);
    }

    public void delete(Bookmark bookmark) {
        bookmarkMapper.delete(bookmark);
    }
}
