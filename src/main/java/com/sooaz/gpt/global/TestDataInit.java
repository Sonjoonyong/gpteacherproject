package com.sooaz.gpt.global;

import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRepository;
import com.sooaz.gpt.domain.user.UserRole;
import lombok.RequiredArgsConstructor;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class TestDataInit {

    private final UserRepository userRepository;

    @EventListener
    public void onApplicationEvent(ContextRefreshedEvent event) {
        // 테스트 데이터 설정
        Optional<User> adminOpt = userRepository.findByLoginId("admin");
        if (adminOpt.isPresent()) {
            userRepository.delete(adminOpt.get().getId());
        }
        User admin = new User();
        admin.setUserLoginId("admin");
        admin.setUserPassword("123!@#");
        admin.setUserNickname("어드민");
        admin.setUserRole(UserRole.ADMIN);
        admin.setUserEmail("admin@mail.com");
        admin.setUserBirthday(new Date());
        admin.setUserAlarmAgreement('1');
        userRepository.save(admin);

        Optional<User> userOpt = userRepository.findByLoginId("user");
        if (userOpt.isPresent()) {
            userRepository.delete(userOpt.get().getId());
        }
        User user = new User();
        user.setUserLoginId("user");
        user.setUserPassword("123!@#");
        user.setUserNickname("홍길동");
        user.setUserRole(UserRole.USER);
        user.setUserEmail("user@mail.com");
        user.setUserBirthday(new Date());
        user.setUserAlarmAgreement('1');
        userRepository.save(user);
    }
}
