package com.sp.yogi.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("faq.faqController")
@RequestMapping("/faq/*")
public class FaqController {
	
	@GetMapping("home")
	public String home() {
		
		return "faq/home";
	}

}
