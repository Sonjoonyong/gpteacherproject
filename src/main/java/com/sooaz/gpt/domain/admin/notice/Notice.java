package com.sooaz.gpt.domain.admin.notice;

import lombok.Data;
import java.util.Date;

@Data
public class Notice {
    private Long id;
    private Long adminId;
    private String noticeTitle;
    private String noticeContent;
    private Integer noticeHit;
    private Date noticeWriteDate;

    public void setNoticeWriteDate(Date noticeWriteDate) {
        this.noticeWriteDate = noticeWriteDate;
    }
    private Integer noticeLike;
}
