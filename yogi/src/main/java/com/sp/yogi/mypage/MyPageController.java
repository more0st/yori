package com.sp.yogi.mypage;

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
	
	@GetMapping("myReview")
	public String myReview() {
		
		return ".mypage.myReview";
	}
	
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
			HttpServletRequest req, HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String cp = req.getContextPath();

		int size = 10;
		int total_page;
		int dataCount;

		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
	

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

		List<MyPage> list = service.listMyPage(info.getUserId());
		

		String query = "";
		String listUrl = cp + "/mypage/orderList";
		String articleUrl = cp + "/mypage/orderList/orderDetail?page=" + current_page;
	
		if (query.length() != 0) {
			listUrl = cp + "/mypage/orderList?" + query;
			articleUrl = cp + "/mypage/orderList/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		return ".mypage.orderList";
	}
	
//	@RequestMapping(value = "orderDetail", method =RequestMethod.GET)
//	public String orderDetail(@RequestParam long num,  @RequestParam String page,
//			HttpSession session, Model model) throws Exception {
//		SessionInfo info = (SessionInfo) session.getAttribute("member");
//		
//		String query = "page=" + page;
//		MyPage dto = service.readOrderDetail(num);
//		
//		if (dto == null) {
//			return "redirect:/mypage/orderList?" + query;
//		}
//		model.addAttribute("detailList2", dto);
//		model.addAttribute("page", page);
//		model.addAttribute("query", query);
//		
//		
//		return ".mypage.orderDetail";
//		
//	}
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
		
		System.out.println(dto.getRestaurantName());
		System.out.println(dto.getOrderNum());
		System.out.println(dto.getMemo());
		System.out.println(dto.getOrder_date());
		System.out.println(dto.getAddr1());
		System.out.println(dto.getAddr2());
		System.out.println(dto.getPayMethod());
		System.out.println(dto.getPay_price());
		System.out.println(dto.getOptionName());
		System.out.println(dto.getOption_price());
		
		
		return ".mypage.orderDetail";
	}
	
}
