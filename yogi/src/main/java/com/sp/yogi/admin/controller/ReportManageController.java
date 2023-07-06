package com.sp.yogi.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yogi.admin.domain.Report;
import com.sp.yogi.admin.service.ReportManageService;

@Controller("admin.reportManageController")
@RequestMapping("/admin/report/*")
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
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam long orderNum,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "review";

		Map<String, Object> map = new HashMap<>();
	    map.put("orderNum", orderNum);
	    map.put("pathname", pathname);
		
		try {
			service.deleteReview(map);
		} catch (Exception e) {
		}

		return "redirect:/admin/report/list?";
	}
	
	
	@RequestMapping(value = "hide", method = RequestMethod.GET)
	public String hide(@RequestParam long orderNum,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "review";
		
		// Map<String, Object> 생성
	    Map<String, Object> map = new HashMap<>();
	    map.put("orderNum", orderNum);
	    map.put("pathname", pathname);
		
		try {
			service.hideReview(map);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/report/list";
	}
	
	@RequestMapping(value = "release", method = RequestMethod.GET)
	public String release(@RequestParam long orderNum,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "review";
		
		// Map<String, Object> 생성
		Map<String, Object> map = new HashMap<>();
		map.put("orderNum", orderNum);
		map.put("pathname", pathname);
		
		try {
			service.hideRelease(map);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/report/list";
	}
	
	@RequestMapping(value = "cancel", method = RequestMethod.GET)
	public String cancel(@RequestParam long reportNum,
			HttpSession session) throws Exception {
		
//		System.out.println(reportNum + "넘값");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "report";


		try {
			service.cancelReport(reportNum, pathname);
		} catch (Exception e) {
		}

		return "redirect:/admin/report/list";
	}

}
