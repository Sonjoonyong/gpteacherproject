package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.global.security.PasswordHasher;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final UserRepository userRepository;
    private final PasswordHasher passwordHasher;

    public User login(LoginDto loginDto) {
        String loginId = loginDto.getUserLoginId();
        String password = loginDto.getUserPassword();
        return login(loginId, password);
    }

    public User login(String loginId, String password) {
        if (loginId == null) {
            return null;
        }

        User loginUser = userRepository.findByLoginId(loginId).stream()
                .filter(user -> {
                    String salt = user.getUserPasswordSalt();
                    String hashedPassword = passwordHasher.hash(password, salt);
                    return user.getUserPassword().equals(hashedPassword);
                })
                .findAny().orElse(null);

        return loginUser;
    }

    @Transactional
    public void join(UserSignupDto userSignupDto) {
        User user = new User();
        user.setUserEmail(userSignupDto.getUserEmail());
        user.setUserLoginId(userSignupDto.getUserLoginId());
        user.setUserNickname(userSignupDto.getUserNickname());
        user.setUserRole(UserRole.USER);
        user.setUserBirthday(userSignupDto.getUserBirthday());
        user.setUserEmailAgreement(userSignupDto.getUserEmailAgreement());

        // 패스워드 해싱
        String password = userSignupDto.getUserPassword();
        String passwordSalt = UUID.randomUUID().toString();
        String hashedPassword = passwordHasher.hash(password, passwordSalt);
        user.setUserPassword(hashedPassword);
        user.setUserPasswordSalt(passwordSalt);

        userRepository.save(user);
    }

    public Optional<User> findById(Long userId) {
        return userRepository.findById(userId);
    }

    public Optional<User> findByEmail(String userEmail) {
        return userRepository.findByEmail(userEmail);
    }

    public List<User> findAll() {
        return userRepository.findAll();
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
