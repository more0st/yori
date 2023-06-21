package com.sp.yogi.faq;

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

import com.sp.yogi.common.FileManager;
import com.sp.yogi.common.MyUtil;
import com.sp.yogi.member.SessionInfo;

@Controller("faq.faqController")
@RequestMapping("/faq/*")
public class FaqController {
	@Autowired
	private FaqService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;

	@RequestMapping(value = "home")
	public String home(@RequestParam(value = "page", defaultValue = "1") int current_page,
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
		String listUrl = cp + "/faq/home";
		String articleUrl = cp + "/faq/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/faq/home?" + query;
			articleUrl = cp + "/faq/article?page=" + current_page + "&" + query;
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

		return ".faq.home";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write(Model model) throws Exception {

		model.addAttribute("mode", "write");

		return ".faq.write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Faq dto, HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "faq";

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertFaq(dto, path);
		} catch (Exception e) {

		}

		return "redirect:/faq/home";
	}

	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String article(@RequestParam long num, @RequestParam String page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		Faq dto = service.readFaq(num);
		if (dto == null) {
			return "redirect:/faq/home?" + query;
		}

		if (!dto.getUserId().equals(info.getUserId()))
			return "redirect:/";

		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

		// 이미지 파일
		List<Faq> listFile = service.listFile(num);

		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);

		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".faq.article";
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
			return "redirect:/faq/home?page=" + page;
		}

		if (!dto.getUserId().equals(info.getUserId())) {
			return "redirect:/";
		}

		try {
			service.deleteFaq(num, pathname);
		} catch (Exception e) {
		}

		return "redirect:/faq/home?" + query;
	}

}
