package com.sp.yogi.ower;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("owner.ownerController")
@RequestMapping("/owner/*")
public class OwnerController {
	
	@GetMapping("home")
	public String home() {
		
		return "owner/home";
	}
	
	@GetMapping("login")
	public String login() {
		
		return "owner/login";
	}
	
	@GetMapping("member")
	public String member() {
		
		return "owner/member";
	}
}
