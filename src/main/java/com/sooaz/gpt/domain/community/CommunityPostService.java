package com.sooaz.gpt.domain.community;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CommunityPostService {

    private final CommunityPostRepository communityPostRepository;

    public CommunityPost save(CommunityPostDto communityPostDto) {
        CommunityPost communityPost = new CommunityPost();
        communityPost.setUserId(communityPostDto.getUserId());
        communityPost.setCommunityPostTitle(communityPostDto.getCommunityPostTitle());
        communityPost.setCommunityPostContent(communityPostDto.getCommunityPostContent());
        communityPost.setCommunityPostCategory(communityPostDto.getCommunityPostCategory());
        return communityPostRepository.save(communityPost);
    }

    public Optional<CommunityPost> findById(Long communityPostId) {
        return communityPostRepository.findById(communityPostId);
    }

    public Optional<CommunityPostViewDto> findByIdForView(Long communityPostId) {
        return communityPostRepository.findByIdForView(communityPostId);
    }

    public List<CommunityPostListDto> findAll(String search) {
        return communityPostRepository.findAll(search);
    }

    public List<CommunityPost> findByUserId(Long userId) {
        return communityPostRepository.findByUserId(userId);
    }


    public void delete(Long communityPostId) {
        communityPostRepository.delete(communityPostId);
    }

    public void update(CommunityPostUpdateDto updateDto) {
        communityPostRepository.update(updateDto);
    }

}
