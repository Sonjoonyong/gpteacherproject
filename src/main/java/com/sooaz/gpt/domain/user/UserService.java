package com.sooaz.gpt.domain.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.awt.*;

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
}
