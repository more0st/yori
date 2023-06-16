package com.sp.yogi.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.reportManageController")
@RequestMapping("/admin/report/*")
public class ReportManageController {
	
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list() throws Exception {

		return ".admin.report.list";

	}

}
