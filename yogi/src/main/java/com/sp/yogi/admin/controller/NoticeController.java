package com.sp.yogi.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yogi.admin.domain.Notice;
import com.sp.yogi.admin.service.NoticeService;
import com.sp.yogi.common.FileManager;
import com.sp.yogi.member.SessionInfo;

@Controller("admin.noticeController")
@RequestMapping("/admin/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private FileManager filemanager;
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model, HttpSession session) throws Exception {
		model.addAttribute("mode", "write");

		return ".admin.notice.write";
	}
	
	@RequestMapping(value = "write", method=RequestMethod.POST)
	public String write(Notice dto, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";

			dto.setUserId(info.getUserId());
			System.out.println("controller");
			service.insertNotice(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/admin/notice/list";
	}
	
	
	@RequestMapping(value = "article", method=RequestMethod.GET)
	public String article(@RequestParam long num,
			HttpSession session, Model model) throws Exception {
		
		service.updateHitCount(num);
		
		Notice dto = service.readNotice(num);
		if (dto == null) {
			return "redirect:/admin/notice/list?";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// 이미지 파일
		List<Notice> listFile = service.listFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);

		
		return ".admin.notice.article";
	}
	
	
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public String list(HttpServletRequest req, HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String cp = req.getContextPath();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		
		
		List<Notice> list = service.listNotice(map);
		
//		String listUrl = "/notice/list";
		String articleUrl = cp + "/admin/notice/article?";
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		
		return ".admin.notice.list";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam long num,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Notice dto = service.readNotice(num);
		if (dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/admin/notice/list?";
		}

		List<Notice> listFile = service.listFile(num);

		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);

		return ".admin.notice.write";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Notice dto,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "notice";

			dto.setUserId(info.getUserId());
			service.updateNotice(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/admin/notice/list?";
	}	
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam long noticeNum,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";

//		SessionInfo info = (SessionInfo) session.getAttribute("member");
//		Notice dto = service.readNotice(num);

		try {
			service.deleteNotice(noticeNum, pathname);
		} catch (Exception e) {
		}

		return "redirect:/admin/notice/list?";
	}
	
	@GetMapping("deleteFile")
	public String deleteFile(HttpSession session, @RequestParam("num") Long num, 
			@RequestParam("imgFileName") String imgFileName,
			@RequestParam("imgNum") Long imgNum) {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		System.out.println("루트 : " + pathname);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("imgNum", imgNum);
		
		try {
			service.deleteFile(map);
		} catch (Exception e) {
		}
		
		filemanager.doFileDelete(imgFileName, pathname);
		
		return "redirect:/admin/notice/update?num=" + num;
	}
	
}
