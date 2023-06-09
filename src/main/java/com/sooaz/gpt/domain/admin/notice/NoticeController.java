package com.sooaz.gpt.domain.admin.notice;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/help/notice")
@RequiredArgsConstructor
public class NoticeController {
    private final NoticeService noticeService;

    private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);


    @GetMapping("/list")
    public String getNotices(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
                             @RequestParam(value = "search", required = false) String search,
                             Model model, HttpServletRequest request) {
        PageHelper.startPage(pageNum, pageSize);
        List<Notice> notices = noticeService.getAllNotices(search);
        PageInfo<Notice> pageInfo = new PageInfo<>(notices);
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        model.addAttribute("loginUser", loginUser);
        model.addAttribute("pageInfo", pageInfo);
        return "notice/noticeList";
    }

    @GetMapping("/view")
    public String getNoticeById(@RequestParam("noticeId") Long id, Model model) {
        noticeService.increaseViewCount(id);
        model.addAttribute("notice", noticeService.getNoticeById(id));
        return "notice/noticeView";
    }

    @GetMapping("/write")
    public String showNoticeWritePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser != null && UserRole.ADMIN.equals(loginUser.getUserRole())) {
            model.addAttribute("noticeCreateDto", new NoticeCreateDto());
            return "notice/noticeNew";
        } else {
            return "redirect:/help/notice/list";
        }
    }

    @PostMapping
    public String createNotice(@ModelAttribute NoticeCreateDto noticeCreateDto, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser != null) {
            noticeCreateDto.setUserId(loginUser.getId());
            noticeService.createNotice(noticeCreateDto);
            redirectAttributes.addFlashAttribute("message", "공지가 등록되었습니다.");
            return "redirect:/help/notice/list";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
            return "redirect:/user/login";
        }
    }

    @PostMapping("/update/{id}")
    public String updateNotice(@PathVariable Long id, @ModelAttribute Notice notice, RedirectAttributes redirectAttributes) {
        noticeService.updateNotice(id, notice);
        redirectAttributes.addFlashAttribute("message", "공지가 업데이트 되었습니다.");
        return "redirect:/help/notice/view?noticeId=" + id;
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser != null && UserRole.ADMIN.equals(loginUser.getUserRole())) {
            Notice notice = noticeService.getNoticeById(id);
            model.addAttribute("notice", notice);
            return "notice/noticeEdit";
        } else {
            return "redirect:/help/notice/list";
        }
    }

    @PostMapping("/delete/{id}")
    public String deleteNotice(@PathVariable("id") Long id, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser != null && UserRole.ADMIN.equals(loginUser.getUserRole())) {
            noticeService.deleteNotice(id);
            redirectAttributes.addFlashAttribute("message", "공지가 삭제되었습니다.");
            return "redirect:/help/notice/list";
        } else {
            return "redirect:/help/notice/list";
        }
    }

}
