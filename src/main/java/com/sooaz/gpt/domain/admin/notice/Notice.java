package com.sooaz.gpt.domain.admin.notice;

import lombok.Data;
import java.util.Date;

@Data
public class Notice {
    private Long id;
    private Long userId;
    private String noticeTitle;
    private String userNickname;
    private String noticeContent;
    private Integer noticeHit;
    private Date noticeWriteDate;
    private Integer noticeLike;
}
