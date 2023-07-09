package com.sp.yogi.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yogi.admin.domain.Notice;
import com.sp.yogi.admin.service.NoticeService;
import com.sp.yogi.member.SessionInfo;

@Controller("notice.noticeController")
@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping(value = "home", method=RequestMethod.GET)
	public String list(HttpServletRequest req, HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String cp = req.getContextPath();
		
		if(info == null) {
			return "redirect:/member/login";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		
		
		List<Notice> list = service.listNotice(map);
		
//		String listUrl = "/notice/list";
		String articleUrl = cp + "/notice/article?";
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		
		return ".notice.home";
	}

	@RequestMapping(value = "article", method=RequestMethod.GET)
	public String article(@RequestParam long num,
			HttpSession session, Model model) throws Exception {
		
		service.updateHitCount(num);
		
		Notice dto = service.readNotice(num);
		if (dto == null) {
			return "redirect:/notice/home?";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// 이미지 파일
		List<Notice> listFile = service.listFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);

		
		return ".notice.article";
	}
	

}
