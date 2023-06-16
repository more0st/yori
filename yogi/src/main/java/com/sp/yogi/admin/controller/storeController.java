package com.sp.yogi.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.storeController")
@RequestMapping("/admin/store/*")
public class storeController {
	@RequestMapping(value = "storeList", method=RequestMethod.GET)
	public String storeList() throws Exception{
		return ".admin.store.storeList";
	}

	@RequestMapping(value = "storeDetail", method=RequestMethod.GET)
	public String storeDetail() throws Exception{
		return ".admin.store.storeDetail";
	}
}
