package com.sooaz.gpt.domain.community;

import com.sooaz.gpt.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommunityPostService {
    private final CommunityPostRepository communityPostRepository;

    private final UserRepository userRepository; //?
    public List<CommunityPost> getAllCommunity(String search) {

        return communityPostRepository.findAll(search);
    }

    public CommunityPost getCommunityById(Long id) {
       /* Community community = communityPostRepository.findById(id).get();
        System.out.println(community);
       // User user = userRepository.findById(community.getUserId().get());
        // get() 오류 ->Optional.java에 봤는데 첨 보는 오류임
        //System.out.println(user);->위에가 오류가 뜨니 받질 못 함
        //community.setUserNickname(user.getUserNickName);
        return community;
        */
        return communityPostRepository.findById(id).orElseThrow(()
                -> new IllegalArgumentException("게시글 찾을 수 없습니다."));


    }

    public CommunityPost createCommunityPost(CommunityPostDto communityPostDto) {
        CommunityPost communityPost = new CommunityPost();
        communityPost.setUserId(communityPostDto.getUserId());
        communityPost.setCommunityPostTitle(communityPostDto.getCommunityTitle());
        communityPost.setCommunityPostContent(communityPostDto.getCommunityContent());
        communityPost.setCommunityPostCategory(communityPostDto.getCommunityPostCategory());
        return communityPostRepository.save(communityPost);
    }


    public void deleteCommunity(Long id) {
        communityPostRepository.deleteById(id);
    }
    public CommunityPost editCommunity(Long id, CommunityPost communityPost) {
        CommunityPost existingCommunityPost = getCommunityById(id);
        communityPost.setId(id);
        communityPost.setUserId(existingCommunityPost.getUserId());
        communityPost.setCommunityPostHit(existingCommunityPost.getCommunityPostHit());
        communityPost.setCommunityPostLike(existingCommunityPost.getCommunityPostLike());
        return communityPostRepository.save(communityPost);
    }
//    public void increaseViewCount(Long id){
//        communityPostRepository.increaseViewCount(id);
//    }
}
