package com.sooaz.gpt.domain.admin;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.admin.trend.AgeGroupCount;
import com.sooaz.gpt.domain.admin.trend.MonthlyUserCount;
import com.sooaz.gpt.domain.admin.user.UserView;
import com.sooaz.gpt.domain.community.Community;
import com.sooaz.gpt.domain.community.communityreply.MyReplyDto;
import com.sooaz.gpt.domain.mypage.MypageService;
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
    private final MypageService mypageService;
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

    @GetMapping("/admin/userComments")
    public String getUserComments(
            @RequestParam("userId") Long userId,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
            Model model
    ){
        PageHelper.startPage(pageNum, pageSize);
        List<MyReplyDto> myReplyDtos = mypageService.getMyCommentList(userId);
        PageInfo<MyReplyDto> pageInfo = new PageInfo<>(myReplyDtos);
        model.addAttribute("pageInfo",pageInfo);
        return "/admin/user/userComments";
    }

    @GetMapping("/admin/userPosts")
    public String getUserPosts(
            @RequestParam("userId") Long userId,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
            Model model
    ){
        PageHelper.startPage(pageNum, pageSize);
        List<Community> communities = mypageService.getPostList(userId);
        PageInfo<Community> pageInfo = new PageInfo<>(communities);
        model.addAttribute("pageInfo", pageInfo);
        log.info("pageInfo = {}", pageInfo);
        return "/admin/user/userPosts";
    }

    @GetMapping("/admin/blockusers")
    public String getBlockedUserList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                     @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
                                     @RequestParam(value = "search", required = false) String search,
                                     @RequestParam(value = "searchOption", required = false) String searchOption,
                                     Model model) {

        PageHelper.startPage(pageNum, pageSize);
        List<UserView> blockedUsers = adminRepository.getBlockedUsers(search, searchOption);
        PageInfo<UserView> pageInfo = new PageInfo<>(blockedUsers);

        model.addAttribute("blockedUsers", blockedUsers);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/blockuser/blockuserList";
    }

    @PostMapping("/admin/unblockUser")
    public String unblockUser(@RequestParam("userId") int userId) {
        adminService.unblockUser(userId);
        return "redirect:/admin/blockusers";
    }

}