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
@Transactional
public class UserService {

    private final UserRepository userRepository;
    private final PasswordHasher passwordHasher;

    public boolean isCorrectPassword(User user, String inputPassord) {
        String passwordSalt = user.getUserPasswordSalt();
        String hashedPassword = passwordHasher.hash(inputPassord, passwordSalt);
        return user.getUserPassword().equals(hashedPassword);
    }

    public User login(LoginDto loginDto) {
        String loginId = loginDto.getUserLoginId().toLowerCase();
        String password = loginDto.getUserPassword();
        return login(loginId, password);
    }

    @Transactional(readOnly = true)
    public User login(String loginId, String password) {
        if (loginId == null) {
            return null;
        }

        User loginUser = userRepository.findByLoginId(loginId).stream()
                .filter(user -> isCorrectPassword(user, password))
                .findAny().orElse(null);

        return loginUser;
    }

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

    @Transactional(readOnly = true)

    public Optional<User> findById(Long userId) {
        return userRepository.findById(userId);
    }

    @Transactional(readOnly = true)
    public Optional<User> findByEmail(String userEmail) {
        return userRepository.findByEmail(userEmail);
    }

    @Transactional(readOnly = true)
    public Optional<User> findByLoginId(String userLoginId) {
        return userRepository.findByLoginId(userLoginId);
    }

    @Transactional(readOnly = true)
    public List<User> findAll() {
        return userRepository.findAll();
    }


    public void update(UserUpdateDto userUpdateDto) {
        userRepository.update(userUpdateDto);
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

    public void delete(Long userId) {
        userRepository.delete(userId);
    }
}
