package com.sooaz.gpt.domain.community;

import lombok.RequiredArgsConstructor;
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
public class CommunityPostRepositoryTest {

    @Autowired
    CommunityPostRepository communityPostRepository;

    CommunityPost getPost() {
        CommunityPost communityPost = new CommunityPost();
        communityPost.setUserId(1L);
        communityPost.setCommunityPostTitle("test title");
        communityPost.setCommunityPostContent("test content");
        communityPost.setCommunityPostCategory("TOEIC");
        return communityPost;
    }

    @Test
    public void crud() {
        CommunityPost newPost = getPost();
        // 생성
        communityPostRepository.save(newPost);

        // 조회
        CommunityPost foundPost = communityPostRepository.findById(newPost.getId()).orElseThrow(IllegalStateException::new);

        assertEquals(newPost.getCommunityPostTitle(), foundPost.getCommunityPostTitle());

        // 업데이트
        newPost.setCommunityPostTitle("revised title");
        communityPostRepository.save(newPost);
        CommunityPost updatedPost = communityPostRepository.findById(newPost.getId()).orElseThrow(IllegalStateException::new);
        assertEquals(newPost.getCommunityPostTitle(), updatedPost.getCommunityPostTitle());

        // 삭제
        communityPostRepository.deleteById(newPost.getId());
        assertTrue(communityPostRepository.findById(newPost.getId()).isEmpty());


    }

}