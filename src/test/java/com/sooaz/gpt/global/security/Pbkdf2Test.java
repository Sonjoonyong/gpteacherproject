package com.sooaz.gpt.global.security;

import org.junit.Test;

import java.util.UUID;

import static org.junit.Assert.*;

public class Pbkdf2Test {

    @Test
    public void hash() {

        String password = "123!@#";
        String salt1 = UUID.randomUUID().toString();
        String salt2 = UUID.randomUUID().toString();

        long startTime = System.currentTimeMillis();

        Pbkdf2 pbkdf2 = new Pbkdf2();
        String hashedPassword1 = pbkdf2.hash(password, salt1);
        String hashedPassword2 = pbkdf2.hash(password, salt2);

        System.out.println("salt1 = " + salt1);
        System.out.println("salt2 = " + salt2);
        System.out.println("hashedPassword1 = " + hashedPassword1);
        System.out.println("hashedPassword2 = " + hashedPassword2);

        assertNotEquals(hashedPassword1, hashedPassword2);

        long endTime = System.currentTimeMillis();

        System.out.println(endTime-startTime + "ms");
    }

}