package com.sooaz.gpt.domain.community;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.admin.notice.Notice;
import com.sooaz.gpt.domain.admin.notice.NoticeCreateDto;
import com.sooaz.gpt.domain.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community/list")
@Slf4j
public class CommunityPostController {
    @GetMapping("/list")
    public String getCommunity( @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
                                @RequestParam(value = "search", required = false) String search,
                                Model model) {
        PageHelper.startPage(pageNum, pageSize);
        List<Community> community = CommunityPostService.getAllCommunity(search);
        PageInfo<Community> pageInfo = new PageInfo<>(community);
        model.addAttribute("pageInfo", pageInfo);
        return "community/postlist";
    }
}



    @GetMapping("/view")
    public String getCommunityById(@RequestParam("communityId") Long id, Model model) {
        model.addAttribute("community", communityPostService.getCommunityById(id));
        return "community/postView";
    }

    @GetMapping("/write")
    public String showCommunityWritePage(Model model) {
        model.addAttribute("communityPostDto", new CommunityPostDto());
        return "community/postNew";
    }

    @PostMapping
    public String createCommunity(@ModelAttribute CommunityPostDto communityPostDto, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser != null) {
            communityPostDto.setUserId(loginUser.getId());
//           커뮤니티 dto 가면 작동을 안 함 이유를 모르겠음
            communityPostService.createNotice(cummunityPostDto);
            redirectAttributes.addFlashAttribute("message", "게시글가 등록되었습니다.");
            return "redirect:/community/list";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
            return "redirect:/user/login";
        }
    }

//    @PostMapping("/update/{id}")
//    public String updateCommunity(@PathVariable Long id, @ModelAttribute Notice notice, RedirectAttributes redirectAttributes) {
//       communityService.updateCommunity(id, community);
//       redirectAttributes.addFlashAttribute("message", "게시글이 업데이트 되었습니다.");
//      return "redirect:/help/notice/view?noticeId=" + id;
//    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Community community = communityService.getCommunityById(id);
        model.addAttribute("community", community);
        return "community/postEdit";
    }

    @PostMapping("/delete/{id}")
    public String deleteCommunity(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        communityService.deleteCommunity(id);
        redirectAttributes.addFlashAttribute("message", "게시글이 삭제되었습니다.");
        return "redirect:/community/postlist";
    }

}