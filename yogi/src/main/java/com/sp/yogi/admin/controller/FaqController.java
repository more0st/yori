package com.sp.yogi.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.faqController")
@RequestMapping("/admin/faq/*")
public class FaqController {

	@RequestMapping(value = "list", method=RequestMethod.GET)
	public String list() throws Exception{
		return ".admin.faq.list";
	}
	
	@RequestMapping(value = "write", method=RequestMethod.GET)
	public String write() throws Exception{
		return ".admin.faq.write";
	}
	
	@RequestMapping(value = "article", method=RequestMethod.GET)
	public String article() throws Exception{
		return ".admin.faq.article";
	}
	
	@RequestMapping(value = "article", method=RequestMethod.POST)
	public String articleSubmit() throws Exception{
		return ".admin.faq.article";
	}
}
