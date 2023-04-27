package com.sooaz.gpt.domain.admin.report;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface ReportMapper {

    void save(Report report);

    Optional<Report> findById(Long reportId);

    List<Report> findAll();

    List<Report> findByUserId(Long userId);

    List<ReportDto> findReportedPosts();

    List<ReportDto> findReportedReplies();
}
