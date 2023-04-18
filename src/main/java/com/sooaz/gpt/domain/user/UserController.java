package com.sooaz.gpt.domain.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {
    @GetMapping("/users/login")
    public String getLoginForm() {
        return "user/login";
    }

    @PostMapping("/users/login")
    public String login(
        @ModelAttribute LoginDto loginDto,
        BindingResult bindingResult,
        @RequestParam String redirectUrl,
        Model model,
        HttpServletRequest request
    ) {


        return "redirect:" + redirectUrl;
    }
}
