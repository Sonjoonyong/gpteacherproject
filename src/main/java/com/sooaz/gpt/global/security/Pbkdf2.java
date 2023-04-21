package com.sooaz.gpt.global.security;

import org.apache.commons.codec.binary.Hex;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

@Component
public class Pbkdf2 implements PasswordHasher {

    public String hash(String password, String salt) {
        try {
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            PBEKeySpec spec = new PBEKeySpec(
                    password.toCharArray(),
                    salt.getBytes(),
                    SecurityConst.ITERATIONS,
                    SecurityConst.KEY_LENGTH
            );
            SecretKey key = factory.generateSecret(spec);
            byte[] hashedBytes = key.getEncoded();
            return Hex.encodeHexString(hashedBytes);
        } catch (Exception e) {
            throw new IllegalArgumentException("패스워드를 해싱할 수 없습니다.", e);
        }
    }
}
