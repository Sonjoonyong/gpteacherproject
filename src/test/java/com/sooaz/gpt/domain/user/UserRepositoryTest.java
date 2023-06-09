package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.security.PasswordHasher;
import com.sooaz.gpt.global.security.Pbkdf2;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Optional;
import java.util.UUID;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/message-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Slf4j
@Transactional
public class UserRepositoryTest {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordHasher passwordHasher = new Pbkdf2();

    @Test
    public void crud() {

        // 생성, 조회
        User user = new User();
        user.setUserLoginId("admin");
        user.setUserPasswordSalt(UUID.randomUUID().toString());
        String hashedPassword = passwordHasher.hash("123!@#", user.getUserPasswordSalt());
        user.setUserPassword(hashedPassword);
        user.setUserNickname("테스트유저");
        user.setUserRole(UserRole.ADMIN);
        user.setUserEmail("admin@google.com");
        user.setUserBirthday(new Date());
        user.setUserEmailAgreement(true);

        userRepository.save(user);

        User foundUser = userRepository.findById(user.getId()).get();

        assertEquals(foundUser.getUserLoginId(), user.getUserLoginId());

        // findByNickname
        Optional<User> byNicknameOpt = userRepository.findByNickname(user.getUserNickname());
        assertTrue(byNicknameOpt.isPresent());

        // findByEmail
        Optional<User> byEmailOpt = userRepository.findByEmail(user.getUserEmail());
        assertTrue(byEmailOpt.isPresent());

        // 업데이트
        UserUpdateDto userUpdateDto = new UserUpdateDto();
        userUpdateDto.setUserId(user.getId());

        userRepository.update(userUpdateDto);

        User updatedUser = userRepository.findById(user.getId()).get();


        // 삭제
        userRepository.delete(user.getId());
        Optional<User> userOptional = userRepository.findById(user.getId());
        assertTrue(userOptional.isEmpty());
    }

}