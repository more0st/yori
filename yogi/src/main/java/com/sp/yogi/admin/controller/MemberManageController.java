package com.sp.yogi.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller("admin.memberManageController")
@RequestMapping("/admin/memberManage/*")
public class MemberManageController {
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list() throws Exception {
		
		return ".admin.memberManage.list";
	}
	
	@RequestMapping(value = "detail", method=RequestMethod.GET)
	public String detail() throws Exception{
		return ".admin.memberManage.detail";
	}
	
}
