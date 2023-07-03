package com.sp.yogi.admin.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.yogi.admin.service.ResManageService;
import com.sp.yogi.common.MyUtil;
import com.sp.yogi.owner.Owner;


@Controller("admin.resManageController")
@RequestMapping("/admin/resManage/*")
public class ResManageController {
	@Autowired
	private ResManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "userId") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String enabled,
			HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();

		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enabled", enabled);
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}

		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 멤버 리스트
		List<Owner> list = service.listOwner(map);

		String query = "";
		String listUrl = cp + "/admin/resManage/main";

		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (enabled.length() != 0) {
			if (query.length() != 0)
				query = query + "&enabled=" + enabled;
			else
				query = "enabled=" + enabled;
		}

		if (query.length() != 0) {
			listUrl = listUrl + "?" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("enabled", enabled);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".admin.resManage.list";
	}
	
	@RequestMapping(value = "orderList", method = RequestMethod.GET)
	public String orderList(@RequestParam(value = "restaurantNum") String restaurantNum, Model model) throws Exception {
		model.addAttribute("dto", service.readRestaurantId(restaurantNum));
		return ".admin.resManage.orderList";
	}
	
	// 업체 정지
	@RequestMapping(value = "updateOwnerState", method = RequestMethod.POST)
	@ResponseBody
	public void updateOwnerState(
			@RequestParam(defaultValue = "") String userId,
			@RequestParam(defaultValue = "") String registerId,
			@RequestParam(defaultValue = "") String reason,
			HttpServletRequest req
			) throws Exception {

		
		try {
			// 회원 활성/비활성 변경
			Map<String, Object> map = new HashMap<>();
			
			map.put("userId", userId);
			map.put("registerId", registerId);
			map.put("reason", reason);
			service.updateOwnerState(map);

		} catch (Exception e) {
			System.out.println(e);
//			state = "false";
		}

//		Map<String, Object> model = new HashMap<>();
//		model.put("state", state);
	
	}
	
}
