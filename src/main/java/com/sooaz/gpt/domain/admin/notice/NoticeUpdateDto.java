package com.sooaz.gpt.domain.admin.notice;

import lombok.Data;

@Data
public class NoticeUpdateDto {
    private Long id;
    private Long userId;
    private String noticeTitle;
    private String noticeContent;
    private Integer noticeHit;
    private Integer noticeLike;
}
