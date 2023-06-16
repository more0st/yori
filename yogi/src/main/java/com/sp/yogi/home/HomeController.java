package com.sp.yogi.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("home.homeController")
@RequestMapping("/home/*")
public class HomeController {

	@GetMapping("home")
	public String home() {
		
		return ".mainLayout";
	}
	
}
