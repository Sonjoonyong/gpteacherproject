package com.sooaz.gpt.domain.community;

import com.sooaz.gpt.domain.user.*;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
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
    @Autowired
    UserService userService;

    CommunityPost getPost() {
        CommunityPost communityPost = new CommunityPost();
        communityPost.setUserId(1L);
        communityPost.setCommunityPostTitle("test title");
        communityPost.setCommunityPostContent("test content");
        communityPost.setCommunityPostCategory("TOEIC");
        return communityPost;
    }

    User getUser() {
        UserSignupDto userSignupDto = new UserSignupDto();
        userSignupDto.setUserEmail("test@test.com");
        userSignupDto.setUserPassword("123!@#");
        userSignupDto.setUserLoginId("testUser");
        userSignupDto.setUserNickname("testUserNickname");
        userSignupDto.setUserBirthday(new Date());
        userSignupDto.setUserAllTermAgreement(true);
        userSignupDto.setUserGeneralTermAgreement(true);
        userSignupDto.setUserPrivacyTermAgreement(true);
        userSignupDto.setUserEmailAgreement(true);
        userService.join(userSignupDto);
        return userService.findByLoginId("testUser").orElseThrow(IllegalStateException::new);
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
        CommunityPostUpdateDto updateDto = new CommunityPostUpdateDto();
        updateDto.setCommunityPostTitle("revised title");
        updateDto.setCommunityPostId(newPost.getId());

        communityPostRepository.update(updateDto);
        CommunityPost updatedPost = communityPostRepository.findById(newPost.getId()).orElseThrow(IllegalStateException::new);
        assertEquals("revised title", updatedPost.getCommunityPostTitle());

        // 삭제
        communityPostRepository.delete(newPost.getId());
        assertTrue(communityPostRepository.findById(newPost.getId()).isEmpty());
    }

    @Test
    public void findByIdForView() {
        User user = getUser();
        CommunityPost newPost = getPost();
        newPost.setUserId(user.getId());
        communityPostRepository.save(newPost);

        Optional<CommunityPostViewDto> optional = communityPostRepository.findByIdForView(newPost.getId(), user.getId());
        CommunityPostViewDto byIdForView = optional.orElseThrow(IllegalStateException::new);

        System.out.println("byIdForView = " + byIdForView);
    }

}