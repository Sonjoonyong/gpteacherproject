package com.sooaz.gpt.domain.community.report;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ReportController {

    @PostMapping("/community/report")
    public String report(
        @ModelAttribute ReportDto reportDto
    ) {
        log.info("reportDto = {}", reportDto);

        return "";
    }
}
