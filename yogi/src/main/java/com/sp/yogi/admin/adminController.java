package com.sp.yogi.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.adminController")
@RequestMapping("/admin/*")
public class adminController {
	@GetMapping("admin")
	public String home() {
		
		return "admin/index";
	}
}
