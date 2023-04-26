package com.sooaz.gpt.domain.admin;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.admin.trend.AgeGroupCount;
import com.sooaz.gpt.domain.admin.trend.MonthlyUserCount;
import com.sooaz.gpt.domain.admin.user.UserView;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {
    private final AdminService adminService;
    private final AdminRepository adminRepository;

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

    @GetMapping("/admin/users")
    public String getUserList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                              @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
                              @RequestParam(value = "search", required = false) String search,
                              @RequestParam(value = "searchOption", required = false) String searchOption,
                              Model model) {

        PageHelper.startPage(pageNum, pageSize);
        List<UserView> users = adminRepository.getUserViewList(search, searchOption);
        PageInfo<UserView> pageInfo = new PageInfo<>(users);

        model.addAttribute("users", users);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/user/userList";
    }

    @PostMapping("/admin/blockUser")
    public String blockUser(@RequestParam("userId") int userId) {
        adminService.blockUser(userId);
        return "redirect:/admin/users";
    }

}