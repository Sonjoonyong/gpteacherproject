package com.sooaz.gpt.domain.user;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
import java.util.Date;

@Data
public class UserOauthSignupDto {

    @Size(min = 2, max = 8, message = "2~8자 범위로 입력해주세요.")
    private String userNickname;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date userBirthday;

    private Boolean userAllTermAgreement;

    @AssertTrue(message = "필수 약관에 동의해주세요.")
    private Boolean userGeneralTermAgreement;

    @AssertTrue(message = "필수 약관에 동의해주세요.")
    private Boolean userPrivacyTermAgreement;

    private Boolean userEmailAgreement;
}
