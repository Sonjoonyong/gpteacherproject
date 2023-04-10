package com.sooaz.gpt.domain.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class UserRepository {

    private final UserMapper userMapper;

    public User save(User user) {
        userMapper.save(user);
        return user;
    }

    public User findById(Long userId) {
        return userMapper.findById(userId).orElseThrow(IllegalStateException::new);
    }
}
