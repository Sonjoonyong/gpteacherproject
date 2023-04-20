package com.sooaz.gpt.domain.admin.question;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/help/question")
@RequiredArgsConstructor
public class QuestionController {
    private final QuestionService questionService;

    @GetMapping("/list")
    public String getQuestion(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                              @RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
                              @RequestParam(value = "search", required = false) String search,
                              Model model){
        PageHelper.startPage(pageNum, pageSize);
        List<Question> questions = questionService.getAllQuestion(search);
        PageInfo<Question> pageInfo = new PageInfo<>(questions);
        model.addAttribute("pageInfo",pageInfo);
        return "question/questionList";
    }

    @GetMapping("/{id}")
    public String getQuestionById(@RequestParam("questionId") Long id, Model model){
        model.addAttribute("question",questionService.getQuestionById(id));
        return "question/questionDetail";
    }

    @PostMapping
    public String createQuestion(@ModelAttribute QuestionCreateDto questionCreateDto, RedirectAttributes redirectAttributes){
        questionService.createQuesiton(questionCreateDto);
        redirectAttributes.addFlashAttribute("message","Question created successfully");
        return "redirect:/questions";
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
