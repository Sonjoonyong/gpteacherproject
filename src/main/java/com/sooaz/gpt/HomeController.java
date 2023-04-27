package com.sooaz.gpt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		return "start";
	}

	@GetMapping("/main")
	public String start() {
		return "home";
	}

}
