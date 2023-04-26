package com.sooaz.gpt.domain.admin.report;

import lombok.Data;

import java.util.Date;

@Data
public class Report {
    private Long id;
    private Long userId;
    private String reportSubject;
    private Long reportSubjectId;
    private String reportReason;
    private Date reportDate;
}
