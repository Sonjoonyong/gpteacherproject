package com.sooaz.gpt.domain.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class UserRepository {

    private final UserMapper userMapper;

    public User save(User user) {
        // 로그인 아이디는 소문자로 처리
        user.setUserLoginId(user.getUserLoginId().toLowerCase());
        userMapper.save(user);
        return user;
    }

    public List<User> findAll() {
        return userMapper.findAll();
    }

    public Optional<User> findById(Long userId) {
        return userMapper.findById(userId);
    }

    public Optional<User> findByLoginId(String userLoginId) {
        return userMapper.findByLoginId(userLoginId.toLowerCase());
    }

    public Optional<User> findByNickname(String userNickname) {
        return userMapper.findByNickname(userNickname);
    }

    public void update(UserUpdateDto userUpdateDto) {
        userMapper.update(userUpdateDto);
    }

    public void delete(Long userId) {
        userMapper.delete(userId);
    }

    public Optional<User> findByEmail(String email) {
        return userMapper.findByEmail(email);
    }
}
