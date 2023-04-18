package com.sooaz.gpt.domain.admin.notice;

import lombok.Data;

@Data
public class NoticeCreateDto {
    private Long adminId;
    private String noticeTitle;
    private String noticeContent;
}
