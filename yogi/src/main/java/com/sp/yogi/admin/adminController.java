package com.sp.yogi.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.adminController")
@RequestMapping("/admin/*")
public class adminController {
	@GetMapping("main")
	public String home() {
		return "admin/index";
	}
	
	@GetMapping("resList")
	public String list() {
		return "admin/list";
	}
	
	@GetMapping("orderList")
	public String orderList() {
		return "admin/orderList";
	}
}
