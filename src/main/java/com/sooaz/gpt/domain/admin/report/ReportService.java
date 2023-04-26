package com.sooaz.gpt.domain.admin.report;

import com.sooaz.gpt.domain.community.CommunityPostService;
import com.sooaz.gpt.domain.community.communityreply.CommunityReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReportService {

    private final ReportRepository reportRepository;
    private final CommunityPostService communityPostService;
    private final CommunityReplyService communityReplyService;

    public void save(ReportDto reportDto) {

        Report report = new Report();

        String reportSubject = reportDto.getReportSubject();

        report.setReportSubjectId(reportDto.getReportSubjectId());
        report.setReportSubject(reportSubject);
        report.setReportReason(reportDto.getReportReason());

        Long userId;
        if (reportSubject.equals("COMMUNITY_POST")) {
            userId = communityPostService.findById(reportDto.getReportSubjectId())
                    .orElseThrow(IllegalStateException::new)
                    .getUserId();

        } else if (reportSubject.equals("COMMUNITY_REPLY")) {
            userId = communityReplyService.findById(report.getReportSubjectId())
                    .orElseThrow(IllegalStateException::new)
                    .getUserId();
        } else {
            throw new IllegalStateException("존재하지 않는 대상입니다.");
        }
        report.setUserId(userId);
        reportRepository.save(report);
    }

    public Optional<Report> findById(Long reportId) {
        return reportRepository.findById(reportId);
    }

    public List<Report> findAll() {
        return reportRepository.findAll();
    }

    public List<Report> findByUserId(Long userId) {
        return reportRepository.findByUserId(userId);
    }
}
