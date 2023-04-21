package com.sooaz.gpt.global;

import com.sooaz.gpt.domain.user.*;
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
    private final UserService userService;

//    // 테스트 데이터 설정
//    @EventListener
//    public void onApplicationEvent(ContextRefreshedEvent event) {
//        // 어드민 유저
//        Optional<User> adminOpt = userRepository.findByLoginId("admin");
//        if (adminOpt.isPresent()) {
//            userRepository.delete(adminOpt.get().getId());
//        }
//        UserSignupDto adminSignupDto = new UserSignupDto();
//
//
//        adminSignupDto.setUserLoginId("admin");
//        adminSignupDto.setUserPassword("123!@#");
//        adminSignupDto.setUserNickname("어드민");
//        adminSignupDto.setUserEmail("admin@mail.com");
//        adminSignupDto.setUserBirthday(new Date());
//        adminSignupDto.setUserEmailAgreement(true);
//
//        userService.join(adminSignupDto);
//        User admin = userRepository.findByLoginId("admin").orElse(null);
//
//        UserUpdateDto adminUpdateDto = new UserUpdateDto();
//        adminUpdateDto.setUserId(admin.getId());
//        adminUpdateDto.setUserRole(UserRole.ADMIN);
//        userRepository.update(adminUpdateDto);
//
//        // 일반 유저
//        Optional<User> userOpt = userRepository.findByLoginId("user");
//        if (userOpt.isPresent()) {
//            userRepository.delete(userOpt.get().getId());
//        }
//
//        UserSignupDto userSignupDto = new UserSignupDto();
//
//        userSignupDto.setUserLoginId("user");
//        userSignupDto.setUserPassword("123!@#");
//        userSignupDto.setUserNickname("홍길동");
//        userSignupDto.setUserEmail("user@mail.com");
//        userSignupDto.setUserBirthday(new Date());
//        userSignupDto.setUserEmailAgreement(true);
//        userService.join(userSignupDto);
//    }
}
