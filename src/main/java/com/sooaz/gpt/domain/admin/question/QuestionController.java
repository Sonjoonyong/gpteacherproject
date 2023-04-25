package com.sooaz.gpt.domain.admin.question;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sooaz.gpt.domain.user.User;
import com.sooaz.gpt.domain.user.UserRole;
import com.sooaz.gpt.global.constant.SessionConst;
import lombok.RequiredArgsConstructor;
import oracle.ucp.proxy.annotation.Post;
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
        model.addAttribute("loginUser", loginUser);

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
            questionService.createQuestion(questionCreateDto);
            redirectAttributes.addFlashAttribute("message", "문의사항 등록되었습니다.");
            return "redirect:/help/question/list";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
            return "redirect:/user/login";
        }
    }

    @PostMapping("/update/{id}")
    public String updateQuestion(@PathVariable Long id, @ModelAttribute Question question, RedirectAttributes redirectAttributes){
        questionService.updateQuestion(id, question);
        redirectAttributes.addFlashAttribute("message","업데이트 성공");
        return "redirect:/help/question/view?questionId=" + id;
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Question question = questionService.getQuestionById(id);
        model.addAttribute("question", question);
        return "question/questionEdit";
    }


    @PostMapping("/delete/{id}")
    public String deleteQuestion(@PathVariable Long id, @ModelAttribute QuestionUpdateDto questionUpdateDto, RedirectAttributes redirectAttributes){
        questionService.deleteQuestion(id);
        redirectAttributes.addFlashAttribute("message", "Question deleted successfully");
        return "redirect:/help/question/list";
    }

    //@PostMapping("/statusUpdate/{id}")
    @RequestMapping(value="/statusUpdate/{id}", method=RequestMethod.POST)
    public String statusUpdate(@PathVariable Long id, @ModelAttribute Question question, RedirectAttributes redirectAttributes){
        questionService.statusUpdate(id, question);
        redirectAttributes.addFlashAttribute("message","업데이트 성공");
        return "redirect:/help/question/view?questionId=" + id;
    }



}
