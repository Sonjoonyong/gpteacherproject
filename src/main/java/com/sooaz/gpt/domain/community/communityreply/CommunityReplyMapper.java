package com.sooaz.gpt.domain.community.communityreply;

import com.sooaz.gpt.domain.community.Community;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface CommunityReplyMapper {
    CommunityReply findById(Long Id);
    List<CommunityReply> findByUserId(Long userId);
    void replyInsert(CommunityReply communityReply);
    void replyUpdate(CommunityReply communityReply);
    List<CommunityReply> replyListSelect(@RequestParam("communityReplyId")Long communityReplyId);

    void ReplyDelete(Long communityReplyId);
}


