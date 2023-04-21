package com.sooaz.gpt.domain.admin;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sooaz.gpt.domain.admin.trend.AgeGroupCount;
import com.sooaz.gpt.domain.admin.trend.MonthlyUserCount;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {
    private final AdminService adminService;

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping("/admin/trend")
    public String getTrends(Model model) throws JsonProcessingException {
        List<MonthlyUserCount> monthlyUserCounts = adminService.getMonthlyUserCounts();
        List<AgeGroupCount> ageGroupCounts = adminService.getAgeGroupCounts();
        String monthlyUserCountsJson = objectMapper.writeValueAsString(monthlyUserCounts);
        String ageGroupCountsJson = objectMapper.writeValueAsString(ageGroupCounts);

        model.addAttribute("monthlyUserCountsJson", monthlyUserCountsJson);
        model.addAttribute("ageGroupCountsJson", ageGroupCountsJson);
        model.addAttribute("monthlyUserCounts", monthlyUserCounts);
        model.addAttribute("ageGroupCounts", ageGroupCounts);

        return "admin/trend/trendView";
    }
}