package com.sooaz.gpt.domain.admin.report;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ReportController {

    private final ReportService reportService;

    @ResponseBody
    @PostMapping("/community/report")
    public String report(
        @ModelAttribute ReportDto reportDto
    ) {
        log.info("reportDto = {}", reportDto);
        reportService.save(reportDto);
        return "ok";
    }
}
