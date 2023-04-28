package com.sooaz.gpt;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		return "start";
	}

	@GetMapping("/main")
	public String start(
			@RequestParam(required = false) String message,
			Model model
	) {
		if (message != null) {
			model.addAttribute("message", message);
		}

		return "home";
	}

}
