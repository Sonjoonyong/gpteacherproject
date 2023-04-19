package com.sooaz.gpt.domain.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final UserRepository userRepository;

    public User login(LoginDto loginDto) {
        String loginId = loginDto.getUserLoginId();
        String password = loginDto.getUserPassword();

        if (loginId == null) {
            return null;
        }

        User loginUser = userRepository.findByLoginId(loginId).stream()
                .filter(user -> user.getUserPassword().equals(password))
                .findAny().orElse(null);

        return loginUser;
    }

    public void join(UserSignupDto userSignupDto) {
        User user = new User();
        user.setUserLoginId(userSignupDto.getUserLoginId());
        user.setUserPassword(userSignupDto.getUserPassword());
        user.setUserNickname(userSignupDto.getUserNickname());
        user.setUserRole(UserRole.USER);
        user.setUserEmail(userSignupDto.getUserEmail());
        user.setUserEmailAgreement(userSignupDto.getUserEmailAgreement());

        // 생일 설정
//        String userBirthday = userSignupDto.getUserBirthday();
//        Date birthDay = null;
//        try {
//            birthDay = new SimpleDateFormat("yyyy-MM-dd").parse(userBirthday);
//        } catch (ParseException e) {
//            throw new IllegalArgumentException("잘못된 생일 형식입니다.", e);
//        }

//        user.setUserBirthday(birthDay);
        user.setUserBirthday(userSignupDto.getUserBirthday());

        userRepository.save(user);
    }

    public boolean isDuplicateLoginId(String loginId) {
        return userRepository.findByLoginId(loginId).isPresent();
    }

    public boolean isDuplicateNickname(String nickname) {
        return userRepository.findByNickname(nickname).isPresent();
    }

    public boolean isDuplicateEmail(String email) {
        return userRepository.findByEmail(email).isPresent();
    }
}
