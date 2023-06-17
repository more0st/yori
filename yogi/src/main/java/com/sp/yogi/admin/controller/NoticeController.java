package com.sp.yogi.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.noticeController")
@RequestMapping("/admin/notice/*")
public class NoticeController {

	@RequestMapping(value = "write", method=RequestMethod.GET)
	public String write() throws Exception{
		return ".admin.notice.write";
	}
	
	@RequestMapping(value = "article", method=RequestMethod.GET)
	public String article() throws Exception{
		return ".admin.notice.article";
	}
	
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public String list() throws Exception{
		return ".admin.notice.list";
	}
}
