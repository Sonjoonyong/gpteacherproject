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
        if (communityPost.getId() == null) {
            communityPostMapper.save(communityPost);
        } else {
            communityPostMapper.update(communityPost);
        }
        return communityPost;
    }

    public Optional<CommunityPost> findById(Long id) {
        return Optional.ofNullable(communityPostMapper.findById(id));
    }
    public List<CommunityPost> findAll(String search) {return communityPostMapper.findAll(search);}
    public List<CommunityPost> findByUserId(Long userId) {
        return communityPostMapper.findByUserId(userId);
    }
    public List<CommunityPost> findBookmarksByUserId(Long userId){
        return communityPostMapper.findBookmarksByUserId(userId);
    }
    public void deleteById(Long id) {
        communityPostMapper.delete(id);}
}

