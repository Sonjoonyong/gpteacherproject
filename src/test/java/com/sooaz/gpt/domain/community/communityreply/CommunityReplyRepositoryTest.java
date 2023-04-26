package com.sooaz.gpt.domain.community.communityreply;

import com.sooaz.gpt.domain.community.CommunityPost;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/message-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Slf4j
@Transactional
public class CommunityReplyRepositoryTest {

    @Autowired
    CommunityReplyRepository communityReplyRepository;

    CommunityPost getPost() {
        CommunityPost communityPost = new CommunityPost();
        communityPost.setId(1L);
        communityPost.setUserId(1L);
        communityPost.setCommunityPostTitle("test title");
        communityPost.setCommunityPostContent("test content");
        communityPost.setCommunityPostCategory("TOEIC");
        return communityPost;
    }

    @Test
    public void crud() {

        // create
        CommunityPost post = getPost();
        CommunityReply reply1 = new CommunityReply();
        reply1.setUserId(1L);
        reply1.setCommunityPostId(post.getId());
        reply1.setCommunityReplyContent("test reply");

        // read
        communityReplyRepository.save(reply1);
        CommunityReply foundReply1 = communityReplyRepository.findById(reply1.getId())
                .orElseThrow(IllegalStateException::new);

        assertEquals(reply1.getCommunityReplyContent(), foundReply1.getCommunityReplyContent());

        CommunityReply reply2 = new CommunityReply();
        reply2.setUserId(1L);
        reply2.setCommunityPostId(post.getId());
        reply2.setCommunityReplyContent("test reply");
        reply2.setCommunityReplyParentsId(reply1.getId()); // reply1의 대댓글

        communityReplyRepository.save(reply2);
        CommunityReply foundReply2 = communityReplyRepository.findById(reply1.getId())
                .orElseThrow(IllegalStateException::new);

        assertEquals(reply1.getId(), reply2.getCommunityReplyParentsId());

        // update
        CommunityReplyUpdateDto updateDto = new CommunityReplyUpdateDto();
        updateDto.setCommunityReplyId(reply1.getId());
        updateDto.setCommunityReplyContent("updated reply content");
        communityReplyRepository.update(updateDto);
        CommunityReply updatedReply1 = communityReplyRepository.findById(reply1.getId())
                .orElseThrow(IllegalStateException::new);

        assertEquals(updatedReply1.getCommunityReplyContent(), updateDto.getCommunityReplyContent());

        // delete
        communityReplyRepository.delete(reply1.getId());
        Optional<CommunityReply> communityReplyOpt = communityReplyRepository
                .findById(reply1.getId());

        assertTrue(communityReplyOpt.isEmpty());
    }

}