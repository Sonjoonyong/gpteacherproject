package com.sooaz.gpt.domain.mypage;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Size;
import java.util.Date;

@Data
public class UserEditInfoDto {

    @Size(min = 2, max = 8, message = "2~8자 범위로 입력해주세요.")
    private String userNickname;

    private String userPassword;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date userBirthday;
    private Boolean userEmailAgreement;
}
