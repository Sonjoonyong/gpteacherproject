package com.sooaz.gpt.domain.user;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Slf4j
@Transactional
public class UserRepositoryTest {

    @Autowired
    UserRepository userRepository;

    @Test
    public void crud() {

        // 생성, 조회
        User user = new User();
        user.setUserLoginId("admin");
        user.setUserPassword("1234");
        user.setUserNickname("어드민");
        user.setUserEmail("admin@google.com");
        user.setUserBirthday(new Date());

        userRepository.save(user);

        User foundUser = userRepository.findById(user.getId()).get();

        assertEquals(foundUser.getUserLoginId(), user.getUserLoginId());

        // 업데이트
        UserUpdateDto userUpdateDto = new UserUpdateDto();
        Date newBirthday = new Date();
        newBirthday.setYear(2000);
        userUpdateDto.setUserBirthday(newBirthday);
        userUpdateDto.setUserId(user.getId());

        userRepository.update(userUpdateDto);

        User updatedUser = userRepository.findById(user.getId()).get();

        assertEquals(newBirthday.getYear(), updatedUser.getUserBirthday().getYear());

        // 삭제
        userRepository.delete(user.getId());
        Optional<User> userOptional = userRepository.findById(user.getId());
        assertTrue(userOptional.isEmpty());
    }
}