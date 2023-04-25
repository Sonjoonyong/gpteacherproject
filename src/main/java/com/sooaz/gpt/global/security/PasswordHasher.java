package com.sooaz.gpt.global.security;

public interface PasswordHasher {
    String hash(String password, String salt);
}
