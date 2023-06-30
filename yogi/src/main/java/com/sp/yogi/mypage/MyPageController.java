package com.sp.yogi.mypage;

import java.io.File;
import java.net.URLDecoder;
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

import com.sp.yogi.common.MyUtil;
import com.sp.yogi.home.Home;
import com.sp.yogi.home.HomeService;
import com.sp.yogi.member.SessionInfo;

@Controller("mypage.myPageController")
@RequestMapping("/mypage/*")
public class MyPageController {
	@Autowired
	private HomeService homeservice;
	@Autowired
	private MyPageService service;
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("myhome")
	public String myhome() {
		return ".mypage.myhome";
	}

	
	
	// sp1의 블로그 참조할 것
	// {orderNum} : 템플릿 변수
	// @GetMapping("{orderNum}/orderDetail")
	
	
	@GetMapping("likeList")
	public String likeList() {
		return ".mypage.likeList";
	}
	
	@GetMapping("coupon")
	public String coupon() {
		return ".mypage.coupon";
	}
	
	@GetMapping("addrList")
	public String addrList(
			Model model,
			HttpSession session
			) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Long memberNum = info.getMemberNum();
		
		List<Home> addr = homeservice.listAddr(memberNum);
		
		model.addAttribute("addr", addr);
		
		return ".mypage.addrList";
	}
	
	@RequestMapping(value="addrWrite", method = RequestMethod.POST)
	public String write(MyPage dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertAddr(dto);
		} catch (Exception e) {
		}
		
		
		return "redirect:/mypage/addrList";
	}
	
	@RequestMapping(value = "addrDelete")
	public String delete(@RequestParam Long addressNum, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			service.deleteAddr(addressNum, info.getUserId());
		} catch (Exception e) {
		} 
		
		return "redirect:/mypage/addrList";
	}
	
	@RequestMapping(value = "orderList")
	public String orderList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req, HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String cp = req.getContextPath();

		int size = 5;
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
		

		List<MyPage> list = service.listMyPage(map);
		

		String query = "";
		String listUrl = cp + "/mypage/orderList";
		String articleUrl = cp + "/mypage/orderList/orderDetail?page=" + current_page;
	
		if (query.length() != 0) {
			listUrl = cp + "/mypage/orderList?" + query;
			articleUrl = cp + "/mypage/orderList/orderDetail?page=" + current_page + "&" + query;
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

		
		return ".mypage.orderList";
	}
	
	@RequestMapping(value = "orderDetail")
	public String orderDetail(@RequestParam long num,  @RequestParam String page,
			HttpServletRequest req,
			HttpSession session, Model model) throws Exception {
				
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String cp = req.getContextPath();
		
		List<MyPage> list = service.listOrderDetail(num);
		MyPage dto = service.readOrderDetail(num);
		
		model.addAttribute("detailList", list);
		model.addAttribute("detailList2", dto);
		
		return ".mypage.orderDetail";
	}
	
	@RequestMapping(value="reviewSubmit", method = RequestMethod.POST)
	public String reviewSubmit(@RequestParam("orderNum") long orderNum,
			@RequestParam("restaurantNum") long restaurantNum,
			MyPage dto, HttpSession session, Model model) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "review";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.insertReview(dto, pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/mypage/orderList";
		
	}
	
	@RequestMapping(value = "reviewList")
	public String reviewList(HttpServletRequest req, HttpSession session, Model model) throws Exception {
		

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		
		List<MyPage> list = service.listReview(map);
		
		model.addAttribute("rev", list);
		
		return ".mypage.orderList";
	}
	
}
