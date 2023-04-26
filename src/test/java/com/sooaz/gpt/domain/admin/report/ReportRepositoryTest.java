package com.sooaz.gpt.domain.admin.report;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/message-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Slf4j
@Transactional
public class ReportRepositoryTest {

    @Autowired
    ReportRepository reportRepository;

    @Test
    public void saveAndFind() {
        Report report = new Report();
        report.setReportSubject("COMMUNITY_POST");
        report.setReportSubjectId(10000L);
        report.setReportReason("도배");
        report.setUserId(123456789L);

        reportRepository.save(report);
        Optional<Report> reportOpt = reportRepository.findById(report.getId());

        assertTrue(reportOpt.isPresent());
        assertEquals(report.getReportSubject(), reportOpt.get().getReportSubject());

        Report report2 = new Report();
        report2.setReportSubject("COMMUNITY_REPLY");
        report2.setReportSubjectId(10001L);
        report2.setReportReason("욕설");
        report2.setUserId(123456789L);
        reportRepository.save(report2);

        List<Report> reports = reportRepository.findAll();
        assertTrue(reports.size() >= 2);
        assertEquals(2, reportRepository.findByUserId(123456789L).size());
    }

}