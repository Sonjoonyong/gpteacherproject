package com.sooaz.gpt.domain.community;

import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommunityPostService {
    private final CommunityPostRepository communityPostRepository;

    private final UserRepository userRepository; //?
    public List<Community> getAllCommunity(String search) {

        return communityPostRepository.findAll(search);
    }

    public Community getCommunityById(Long id) {
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

    public Community createCommunityPost(CommunityPostDto communityPostDto) {
        Community community = new Community();
        community.setUserId(communityPostDto.getUserId());
        community.setCommunityPostTitle(communityPostDto.getCommunityTitle());
        community.setCommunityPostContent(communityPostDto.getCommunityContent());
        community.setCommunityPostCategory(communityPostDto.getCommunityPostCategory());
        return communityPostRepository.save(community);
    }


    public void deleteCommunity(Long id) {
        communityPostRepository.deleteById(id);
    }
    public Community editCommunity(Long id, Community community) {
        Community existingCommunity = getCommunityById(id);
        community.setId(id);
        community.setUserId(existingCommunity.getUserId());
        community.setCommunityPostHit(existingCommunity.getCommunityPostHit());
        community.setCommunityPostLike(existingCommunity.getCommunityPostLike());
        return communityPostRepository.save(community);
    }
//    public void increaseViewCount(Long id){
//        communityPostRepository.increaseViewCount(id);
//    }
}
