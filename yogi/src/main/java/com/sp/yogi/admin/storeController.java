package com.sp.yogi.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.storeController")
@RequestMapping("/admin/store/*")
public class storeController {
	@GetMapping("storeList")
	public String storeList() {
		return "admin/store/storeList";
	}
	@GetMapping("storeDetail")
	public String storeDetail() {
		return "admin/store/storeDetail";
	}
}
