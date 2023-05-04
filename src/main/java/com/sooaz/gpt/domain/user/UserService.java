package com.sooaz.gpt.domain.user;

import com.sooaz.gpt.domain.mypage.flashcard.Flashcard;
import com.sooaz.gpt.domain.mypage.flashcard.FlashcardService;
import com.sooaz.gpt.global.constant.RedisConst;
import com.sooaz.gpt.global.email.Gmail;
import com.sooaz.gpt.global.security.PasswordHasher;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class UserService {

    private final UserRepository userRepository;
    private final FlashcardService flashcardService;
    private final PasswordHasher passwordHasher;
    private final JedisPool jedisPool;
    private final Gmail gmail;

    public static final String[] USER_SECURITY_QUESTIONS = {
            "가장 아끼는 보물 1호는?",
            "내가 졸업한 초등학교는?",
            "나의 어머님 성함은?",
            "나의 아버님 성함은?",
            "가장 좋아하는 색깔은?",
            "가장 좋아하는 음식은?",
            "가장 좋아하는 동물은?"
    };

    public boolean isCorrectPassword(User user, String inputPassword) {
        String passwordSalt = user.getUserPasswordSalt();
        String hashedPassword = passwordHasher.hash(inputPassword, passwordSalt);
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
        user.setUserSecurityQuestion(userSignupDto.getUserSecurityQuestion());
        user.setUserSecurityAnswer(userSignupDto.getUserSecurityAnswer());

        // 패스워드 해싱
        String password = userSignupDto.getUserPassword();
        String passwordSalt = UUID.randomUUID().toString();
        String hashedPassword = passwordHasher.hash(password, passwordSalt);
        user.setUserPassword(hashedPassword);
        user.setUserPasswordSalt(passwordSalt);

        userRepository.save(user);

        // 기본 플래시카드 보관함 제공
        Flashcard flashcard = new Flashcard();
        flashcard.setUserId(user.getId());
        flashcard.setFlashcardName("default");
        flashcardService.insertFlashcard(flashcard);
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
        String newPassword = userUpdateDto.getUserPassword();
        String passwordSalt = userUpdateDto.getUserPasswordSalt();
        if (newPassword != null) {
            String hashedPassword = passwordHasher.hash(newPassword, passwordSalt);
            userUpdateDto.setUserPassword(hashedPassword);
        }

        userRepository.update(userUpdateDto);
    }

    @Transactional(readOnly = true)
    public boolean isDuplicateLoginId(String loginId) {
        return userRepository.findByLoginId(loginId).isPresent();
    }

    @Transactional(readOnly = true)
    public boolean isDuplicateNickname(String nickname) {
        return userRepository.findByNickname(nickname).isPresent();
    }

    @Transactional(readOnly = true)
    public boolean isDuplicateEmail(String email) {
        return userRepository.findByEmail(email).isPresent();
    }

    public void delete(Long userId) {
        userRepository.delete(userId);
    }

    public String sendEmailCode(String userEmail) {
        String emailCode = UUID.randomUUID().toString()
                .replaceAll("-", "").substring(0, 5);

        log.info("발급된 emailCode = {}", emailCode);

        gmail.sendEmail(
                userEmail,
                "GPTeacher 인증코드입니다.",
                "아래 코드를 인증 창에 입력 후 회원가입을 진행하세요. \n\n" + emailCode
        );

        try (Jedis jedis = jedisPool.getResource()) {
            // 이메일 인증 코드 유효 기간 3분
            jedis.setex(
                    RedisConst.USER_EMAIL_CODE + userEmail,
                    RedisConst.USER_EMAIL_CODE_EXP,
                    emailCode
            );
        } catch (Exception e) {
            log.error("Redis error: ", e);
        }

        return emailCode;
    }

    public boolean isValidEmailCode(String userEmail, String emailCode) {
        try (Jedis jedis = jedisPool.getResource()) {
            String foundEmailCode = jedis.get(RedisConst.USER_EMAIL_CODE + userEmail);
            return emailCode.equals(foundEmailCode);
        } catch (Exception e) {
            log.error("Redis error: ", e);
        }

        return false;
    }

    public void setEmailValidated(String userEmail) {
        try (Jedis jedis = jedisPool.getResource()) {
            // 이메일 인증 유효 기간 10분
            jedis.setex(
                    RedisConst.USER_EMAIL_VALIDATED + userEmail,
                    RedisConst.USER_EMAIL_VALIDATED_EXP,
                    "true");
        } catch (Exception e) {
            log.error("Redis error: ", e);
        }
    }

    public boolean isEmailValidated(String userEmail) {
        try (Jedis jedis = jedisPool.getResource()) {
            String isValidated = jedis.get(RedisConst.USER_EMAIL_VALIDATED + userEmail);
            return isValidated != null && isValidated.equals("true");
        } catch (Exception e) {
            log.error("Redis error: ", e);
        }

        return false;
    }

    public void invalidEmailCode(String userEmail) {
        try (Jedis jedis = jedisPool.getResource()) {
            jedis.set(RedisConst.USER_EMAIL_VALIDATED + userEmail, "false");
        } catch (Exception e) {
            log.error("Redis error: ", e);
        }
    }
}
