package com.sooaz.gpt.domain.community.like;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class LikeRepository {

    private final LikeMapper likeMapper;

    public void save(Long communityPostId, Long userId) {
        likeMapper.save(communityPostId, userId);
    }

    public Optional<Like> findById(Long communityPostId, Long userId) {
        return likeMapper.findById(communityPostId, userId);
    }

    public void delete(Like like) {
        likeMapper.delete(like);
    }
}
