package com.sp.yogi.ower;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("owner.memberController")
@RequestMapping("/owner/*")
public class OwnerController {
	
	@GetMapping("login")
	public String login() {
		
		return "owner/login";
	}
}
