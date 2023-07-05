package com.sp.yogi.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.yogi.admin.domain.MainDomain;
import com.sp.yogi.admin.service.mainService;
import com.sp.yogi.member.SessionInfo;

@Controller("admin.mainController")
public class MainController {
	
	@Autowired
	private mainService mainService;
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String method(Model model,
			HttpSession session
			) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if (info == null) {
			return ".home.home";
		}
		
		int membership = info.getMembership();
		
		if(membership != 99) {
			return ".home.home";
		}
		
		List<MainDomain> bestOwner = mainService.bestOwner();
		List<MainDomain> recentSales = mainService.recentSales();
		
		Long memberCount = mainService.memberCount();
		Long ownerCount = mainService.ownerCount();
		Long ownerWaitCount = mainService.ownerWaitCount();
		Long totaySales = mainService.todaySales();
		
		model.addAttribute("bestOwner", bestOwner);
		model.addAttribute("recentSales", recentSales);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("ownerCount", ownerCount);
		model.addAttribute("ownerWaitCount", ownerWaitCount);
		model.addAttribute("totaySales", totaySales);
		
		return ".adminLayout";
	}
}
