package com.sooaz.gpt.domain.admin.report;

import lombok.Data;

import java.util.Date;

@Data
public class ReportDto {
    private Long id;
    private Long userId;
    private String userLoginId;
    private Long reportSubjectId;
    private String reportSubject;
    private String reportReason;
    private Date creationDate;
    private Date reportDate;
    private String postTitle;
    private String replyContent;
}
