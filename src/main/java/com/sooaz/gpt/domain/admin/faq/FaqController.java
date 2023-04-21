package com.sooaz.gpt.domain.admin.faq;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/help/faq")
@RequiredArgsConstructor
public class FaqController {
    private final FaqService faqService;

    @GetMapping("/list")
    public String getFaqs(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
                             @RequestParam(value = "search", required = false) String search,
                             Model model) {
        PageHelper.startPage(pageNum, pageSize);
        List<Faq> faqs = faqService.getAllFaqs(search);
        PageInfo<Faq> pageInfo = new PageInfo<>(faqs);
        model.addAttribute("pageInfo", pageInfo);
        return "faq/faqList";
    }

    @GetMapping("/view")
    public String getFaqById(@RequestParam("faqId") Long id, Model model) {
        model.addAttribute("faq", faqService.getFaqById(id));
        return "faq/faqView";
    }

    @GetMapping("/write")
    public String showFaqWritePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser != null && UserRole.ADMIN.equals(loginUser.getUserRole())) {
            model.addAttribute("faqCreateDto", new FaqCreateDto());
            return "faq/faqNew";
        } else {
            return "redirect:/help/faq/list";
        }
    }

    @PostMapping
    public String createFaq(@ModelAttribute FaqCreateDto faqCreateDto, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser != null) {
            faqCreateDto.setUserId(loginUser.getId());
            faqService.createFaq(faqCreateDto);
            redirectAttributes.addFlashAttribute("message", "자주묻는질문이 등록되었습니다.");
            return "redirect:/help/faq/list";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
            return "redirect:/user/login";
        }
    }

    @PostMapping("/update/{id}")
    public String updateFaq(@PathVariable Long id, @ModelAttribute Faq faq, RedirectAttributes redirectAttributes) {
        faqService.updateFaq(id, faq);
        redirectAttributes.addFlashAttribute("message", "자주묻는질문이 업데이트 되었습니다.");
        return "redirect:/help/faq/view?faqId=" + id;
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Faq faq = faqService.getFaqById(id);
        model.addAttribute("faq", faq);
        return "faq/faqEdit";
    }

    @PostMapping("/delete/{id}")
    public String deleteFaq(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        faqService.deleteFaq(id);
        redirectAttributes.addFlashAttribute("message", "자주묻는질문이 삭제되었습니다.");
        return "redirect:/help/faq/list";
    }

}
