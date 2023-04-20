package com.sooaz.gpt.domain.community;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommunityPostService {
    private final CommunityPostRepository communityPostRepository;

    public List<Community> getAllCommunity(String search) {

        return communityPostRepository.findAll(search);
    }

    public Community getCommunityById(Long id) {
        return communityPostRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("게시글 찾을 수 없습니다."));


    }

    public Community createCommunity(CommunityPostDto communityPostDto) {
        Community community = new Community();
        community.setUserId(communityPostDto.getUserId());
        community.setCommunityPostTitle(communityPostDto.getCommunityTitle());
        community.setCommunityPostContent(communityPostDto.getCommunityContent());
        return communityPostRepository.save(community);
    }
    public Community updateCommunity(Long id, Community community) {
        Community existingCommunity = getCommunityById(id);
        community.setId(id);
        community.setUserId(existingCommunity.getUserId());
        community.setCommunityPostHit(existingCommunity.getCommunityPostHit());
        community.setCommunityPostLike(existingCommunity.getCommunityPostLike());
        return communityPostRepository.save(community);
    }


    public void deleteCommunity(Long id) {
        communityPostRepository.deleteById(id);
    }
}


