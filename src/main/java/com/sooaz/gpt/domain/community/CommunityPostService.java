package com.sooaz.gpt.domain.community;

import com.sooaz.gpt.domain.admin.notice.Notice;
import com.sooaz.gpt.domain.admin.notice.NoticeCreateDto;
import com.sooaz.gpt.domain.admin.notice.NoticeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommunityPostService {
    private final CommunityPostRepository communityPostRepository;

    public List<Notice> getAllCommunity(String search) {

        return communityPostRepository.findAll(search);
    }

    public Community getCommunityById(Long id) {
        return communityPostRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("게시글 찾을 수 없습니다."));

        public Community createCommunity(CommunityPostDto communityPostDto) {
            Community community = new Community();
            community.setUserId(communityPostDto.getUserId());
            Community.setCommunityTitle(communityPostDto.getCommunityTitle());
            Community.setCommunityContent(communityPostDto.getCommunityContent());
            return communityPostRepository.save(community);
        }
        public Community updateCommunity(Long id, Community community) {
            Community existingNotice = getCommunityById(id);
            community.setId(id);
            community.setUserId(existingNotice.getUserId());
            community.setNoticeHit(existingNotice.getCommunityPostHit());
            community.setNoticeLike(existingNotice.getCommunityPostLike());
            return communityPostRepository.save(community);
        }


        public void deleteNotice(Long id) {
            communityPostRepository.deleteById(id);
        }
    }
}
