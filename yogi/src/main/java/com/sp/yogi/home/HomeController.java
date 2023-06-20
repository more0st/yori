package com.sp.yogi.home;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.yogi.member.SessionInfo;

import org.springframework.web.bind.annotation.GetMapping;

@Controller("home.homeController")
@RequestMapping("/home/*")
public class HomeController {
	@Autowired
	private HomeService service;

	@GetMapping("home")
	public String home(HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info == null) {
			return ".mainLayout";
		}
		
		Long memberNum = info.getMemberNum();
		
		List<Home> addr = service.listAddr(memberNum);
		
		model.addAttribute("addr", addr);
		
		return ".mainLayout";
	}
	
}
