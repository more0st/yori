package com.sp.yogi.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.yogi.admin.domain.Report;
import com.sp.yogi.admin.service.ReportManageService;

@Controller("admin.reportManageController")
@RequestMapping("/admin/report")
public class ReportManageController {
	@Autowired
	private ReportManageService service;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {

		//model.addAttribute("dto", service.readReport(reportNum));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Report> list = service.listReport(map);
		
		model.addAttribute("list", list);
		
		return ".admin.report.list";

	}

}
