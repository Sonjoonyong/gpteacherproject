package com.sooaz.gpt.domain.community;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class CommunityPostRepository {

    private final CommunityPostMapper communityPostMapper;

    public CommunityPost save(CommunityPost communityPost) {
        communityPostMapper.save(communityPost);
        return communityPost;
    }

    public void update(CommunityPostUpdateDto updateDto) {
        communityPostMapper.update(updateDto);
    }

    public Optional<CommunityPost> findById(Long communityPostId) {
        return communityPostMapper.findById(communityPostId);
    }

    public Optional<CommunityPostViewDto> findByIdForView(Long communityPostId, Long userId) {
        return communityPostMapper.findByIdForView(communityPostId, userId);
    }

    public List<CommunityPostListDto> findAll(String search) {
        return communityPostMapper.findAll(search);
    }

    public List<CommunityPost> findByUserId(Long userId) {
        return communityPostMapper.findByUserId(userId);
    }

    public List<CommunityPost> findBookmarksByUserId(Long userId) {
        return communityPostMapper.findBookmarksByUserId(userId);
    }

    public void delete(Long communityPostId) {
        communityPostMapper.delete(communityPostId);
    }

    public List<CommunityPostListDto> bestListAll() {return communityPostMapper.bestListAll();
    }
}

