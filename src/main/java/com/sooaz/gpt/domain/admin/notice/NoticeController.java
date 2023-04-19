package com.sooaz.gpt.domain.admin.notice;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/help/notice")
@RequiredArgsConstructor
public class NoticeController {
    private final NoticeService noticeService;

    @GetMapping("/list")
    public String getNotices(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
                             @RequestParam(value = "search", required = false) String search,
                             Model model) {
        PageHelper.startPage(pageNum, pageSize);
        List<Notice> notices = noticeService.getAllNotices(search);
        PageInfo<Notice> pageInfo = new PageInfo<>(notices);
        model.addAttribute("pageInfo", pageInfo);
        return "notice/noticeList";
    }

    @GetMapping("/view")
    public String getNoticeById(@RequestParam("noticeId") Long id, Model model) {
        model.addAttribute("notice", noticeService.getNoticeById(id));
        return "notice/noticeView";
    }
    
    @PostMapping
    public String createNotice(@ModelAttribute NoticeCreateDto noticeCreateDto, RedirectAttributes redirectAttributes) {
        noticeService.createNotice(noticeCreateDto);
        redirectAttributes.addFlashAttribute("message", "Notice created successfully");
        return "redirect:/notices";
    }

    @PutMapping("/{id}")
    public String updateNotice(@PathVariable Long id, @ModelAttribute NoticeUpdateDto noticeUpdateDto, RedirectAttributes redirectAttributes) {
        noticeService.updateNotice(id, noticeUpdateDto);
        redirectAttributes.addFlashAttribute("message", "Notice updated successfully");
        return "redirect:/notices/" + id;
    }

    @DeleteMapping("/{id}")
    public String deleteNotice(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        noticeService.deleteNotice(id);
        redirectAttributes.addFlashAttribute("message", "Notice deleted successfully");
        return "redirect:/notices";
    }

}
