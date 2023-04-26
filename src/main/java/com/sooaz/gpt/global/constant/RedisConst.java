package com.sooaz.gpt.global.constant;

public abstract class RedisConst {
    public static final String USER_EMAIL_CODE = "user-email-code:";
    public static final String USER_EMAIL_VALIDATED = "user-email-validated:";

    public static final int USER_EMAIL_CODE_EXP = 60 * 3;
    public static final int USER_EMAIL_VALIDATED_EXP = 60 * 10;
}
