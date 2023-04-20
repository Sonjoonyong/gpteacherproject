package com.sooaz.gpt.domain.admin.question;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/help/question")
@RequiredArgsConstructor
public class QuestionController {
    private final QuestionService questionService;

    @GetMapping("/list")
    public String getQuestions(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                              @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
                              @RequestParam(value = "search", required = false) String search,
                              Model model){
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questions = questionService.getAllQuestions(search);
        PageInfo<Question> pageInfo = new PageInfo<>(questions);
        model.addAttribute("pageInfo",pageInfo);
        return "question/questionList";
    }

    @GetMapping("/view")
    public String getQuestionById(@RequestParam Long questionId, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute(SessionConst.LOGIN_USER);
        if (loginUser.getUserRole()== UserRole.ADMIN || loginUser.getId().equals(questionService.getQuestionById(questionId).getUserId()) ){
            model.addAttribute("question",questionService.getQuestionById(questionId));
            return "question/questionView";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
            return "redirect:/help/question/list";
        }
    }

    @GetMapping("/write")
    public String showQuestionWritePage(Model model) {
        model.addAttribute("questionCreateDto", new QuestionCreateDto());
        return "question/questionNew";
    }

    @PostMapping
    public String createQuestion(@ModelAttribute QuestionCreateDto questionCreateDto, RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser != null) {
            questionCreateDto.setUserId(loginUser.getId());
            questionService.createQuesiton(questionCreateDto);
            redirectAttributes.addFlashAttribute("message", "문의사항 등록되었습니다.");
            return "redirect:/help/question/list";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
            return "redirect:/user/login";
        }
    }

    @PutMapping("/{id}")
    public String updateQuestion(@PathVariable Long id, @ModelAttribute QuestionUpdateDto questionUpdateDto, RedirectAttributes redirectAttributes){
        questionService.updateQuestion(id, questionUpdateDto);
        redirectAttributes.addFlashAttribute("message","Question updated successfully");
        return "redirect:/questions/" + id;
    }

    @DeleteMapping("/{id}")
    public String deleteQuestion(@PathVariable Long id, @ModelAttribute QuestionUpdateDto questionUpdateDto, RedirectAttributes redirectAttributes){
        questionService.deleteQuestion(id);
        redirectAttributes.addFlashAttribute("message", "Question deleted successfully");
        return "redirect:/questions";
    }


}
