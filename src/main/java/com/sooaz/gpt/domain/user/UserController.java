package com.sooaz.gpt.domain.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    @GetMapping("/users/login")
    public String getLoginForm() {
        return "user/login";
    }
}
