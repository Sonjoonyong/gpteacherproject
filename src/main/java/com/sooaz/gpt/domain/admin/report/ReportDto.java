package com.sooaz.gpt.domain.admin.report;

import lombok.Data;

@Data
public class ReportDto {
    private Long reportSubjectId;
    private String reportSubject;
    private String reportReason;
}
