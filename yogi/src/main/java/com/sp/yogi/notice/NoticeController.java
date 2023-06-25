package com.sp.yogi.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.yogi.admin.domain.Notice;
import com.sp.yogi.member.SessionInfo;

@Controller("notice.noticeController")
@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public String list(HttpServletRequest req, HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String cp = req.getContextPath();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		
		
//		List<Notice> list = service.listNotice(map);
		
		String listUrl = "/notice/list";
		String articleUrl = cp + "/notice/article?";
		
		model.addAttribute("list", listUrl);
		model.addAttribute("articleUrl", articleUrl);
		
		return ".notice.home";
	}

	@GetMapping("home")
	public String home() {
		
		return ".notice.home";
	}
	
	@GetMapping("article")
	public String article() {
		
		return ".notice.article";
	}
	
	

}
