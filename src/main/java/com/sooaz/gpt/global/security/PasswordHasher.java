package com.sooaz.gpt.global.security;

import org.springframework.stereotype.Component;


public interface PasswordHasher {
    String hash(String password, String salt);
}
