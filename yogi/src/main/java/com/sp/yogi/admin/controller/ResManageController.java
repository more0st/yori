package com.sp.yogi.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller("admin.resManageController")
@RequestMapping("/admin/resManage/*")
public class ResManageController {
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String list() throws Exception {
		
		return ".admin.resManage.list";
	}
	
	@RequestMapping(value = "orderList", method = RequestMethod.GET)
	public String orderList() throws Exception {
		
		return ".admin.resManage.orderList";
	}
}
