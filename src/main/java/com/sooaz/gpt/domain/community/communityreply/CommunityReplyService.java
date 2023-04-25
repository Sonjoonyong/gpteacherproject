package com.sooaz.gpt.domain.community.communityreply;

import com.sooaz.gpt.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommunityReplyService {
    private final CommunityReplyRepository communityReplyRepository;
    private final UserRepository userRepository;//?

    public CommunityReply reply(CommunityReply communityReply) {
        return communityReplyRepository.replyInsert(communityReply);
    }

    //    public CommunityReply getCommunityReplyById(Long id) {
//       return communityReplyRepository.findById(id).orElseThrow(()
//               -> new IllegalArgumentException("댓글을 찾을 수 없습니다."));
//    }
////    댓글 기능에선 존재해야할 의미는? 밑에 editCommunityReply기능의 getCommunityReplyById를 위해서
//        public CommunityReply updateCommunityReply(Long id, CommunityReply communityReply) {
//            CommunityReply existingCommunityReply = getCommunityReplyById(id);
//            communityReply.setId(id);
//            communityReply.setUserId(existingCommunityReply.getUserId());
//            return communityReplyRepository.save(communityReply);
//        }
    public void deleteCommunityReply(Long id) {
        //
        communityReplyRepository.deleteById(id);
    }

    //        public CommunityReply editCommunityReply(Long id, CommunityReply communityReply) {
//            CommunityReply existingCommunityReply = getCommunityReplyById(id);
//            communityReply.setId(id);
//            communityReply.setUserId(existingCommunityReply.getUserId());
//            return communityReplyRepository.save(communityReply);
//            //25행 오류 수정을 위하여
//            // 2행 import com.sooaz.gpt.domain.community.Community; 가 추가됨
//            //커뮤니티에 넣는게 맞을듯
//        }
    public CommunityReply createCommunityReply(CommunityReply communityReply) {
        CommunityReply communityReply1 = new CommunityReply();
        communityReply.setUserId(communityReply.getUserId());
        communityReply.setCommunityReplyWritedate(communityReply.getCommunityReplyWritedate());
        communityReply.setCommunityReplyContent(communityReply.getCommunityReplyContent());
        communityReply.setCommunityReplyParentsId(communityReply.getCommunityReplyParentsId());
        return communityReplyRepository.replyInsert(communityReply);
    }
}

