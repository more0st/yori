package com.sp.yogi.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("home.homeController")
@RequestMapping("/home/*")
public class HomeController {
	@Autowired
	private HomeService service;

	@GetMapping("home")
	public String home() {
		
		String userName = service.readName(1L);
		
		System.out.println("유저네임 : " + userName);
		
		return ".mainLayout";
	}
	
}
