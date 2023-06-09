package com.sooaz.gpt.domain.admin.report;

import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
@Slf4j
public class ReportRepository {

    private final ReportMapper reportMapper;

    public Optional<Report> save(Report report) {
        reportMapper.save(report);
        return Optional.ofNullable(report);
    }

    public Optional<Report> findById(Long reportId) {
        return reportMapper.findById(reportId);
    }

    public List<Report> findAll() {
        return reportMapper.findAll();
    }

    public List<Report> findByUserId(Long userId) {
        return reportMapper.findByUserId(userId);
    }

    public List<ReportDto> findReportedPosts(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return reportMapper.findReportedPosts(pageNum, pageSize);
    }

    public List<ReportDto> findReportedReplies(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return reportMapper.findReportedReplies(pageNum, pageSize);
    }
}
