package com.sooaz.gpt.domain.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public User login(LoginDto loginDto) {
        loginDto.getLoginId();
        loginDto.getPassword();

        return null;
    }
}
