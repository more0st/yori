package com.sp.yogi.admin.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.yogi.admin.domain.Faq;
import com.sp.yogi.admin.service.FaqService;
import com.sp.yogi.common.FileManager;
import com.sp.yogi.common.MyUtil;
import com.sp.yogi.member.SessionInfo;

@Controller("admin.faqController")
@RequestMapping("/admin/faq/*")
public class FaqController {
	@Autowired
	private FaqService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	

	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req, HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String cp = req.getContextPath();

		int size = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Faq> list = service.listFaq(map);

		String query = "";
		String listUrl = cp + "/admin/faq/list";
		String articleUrl = cp + "/admin/faq/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/admin/faq/list?" + query;
			articleUrl = cp + "/admin/faq/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".admin.faq.list";
	}

	
	@RequestMapping(value = "write", method=RequestMethod.GET)
	public String write() throws Exception{
		return ".admin.faq.write";
	}
	
	@RequestMapping(value = "article", method=RequestMethod.GET)
	public String article(@RequestParam long num, @RequestParam String page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpSession session, Model model)  throws Exception {
		
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		
		Faq dto = service.readFaq(num);
		if (dto == null) {
			return "redirect:/admin/faq/list?" + query;
		}
		
		// 바꿔야함
		if (!info.getUserId().equals("admin"))
			return "redirect:/";
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		List<Faq> listFile = service.listFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);

		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		
		return ".admin.faq.article";
	}
	
	@RequestMapping(value = "article", method=RequestMethod.POST)
	public String articleSubmit() throws Exception{
		return ".admin.faq.article";
	}
	
	
	
	@RequestMapping(value = "answer", method = RequestMethod.POST)
	public String answerSubmit(Faq dto, 
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		
		try {
			dto.setAnswerId(info.getUserId());
			service.answerFaq(dto);
		} catch (Exception e) {
		}

		return "redirect:/admin/faq/list?" + query;
	}
	
	@RequestMapping(value = "deleteAnswer", method = RequestMethod.POST)
	public String deleteAnswer(Faq dto, 
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		
		try {
			dto.setAnswerId(info.getUserId());
			service.deleteAnswer(dto);
		} catch (Exception e) {
		}

		return "redirect:/admin/faq/list?" + query;
	}
	
	
	
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam long num, @RequestParam String page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "faq";

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Faq dto = service.readFaq(num);
		if (dto == null) {
			return "redirect:/admin/faq/list?page=" + page;
		}

		// 바꿔야함
		if (!info.getUserId().equals("admin"))
			return "redirect:/";

		try {
			service.deleteFaq(num, pathname);
		} catch (Exception e) {
		}

		return "redirect:/admin/faq/list?" + query;
	}
	
	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum, HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "faq";

		Faq dto = service.readFile(fileNum);
		if (dto != null) {
			fileManager.doFileDelete(dto.getImgFileName(), pathname);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field", "fileNum");
		map.put("num", fileNum);
		service.deleteFile(map);

		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		return model;
	}
	
}
