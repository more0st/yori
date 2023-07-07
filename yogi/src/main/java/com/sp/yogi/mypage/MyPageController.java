package com.sp.yogi.mypage;

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
	private LikeService likeservice;
	@Autowired
	private CouponService couponService;
	@Autowired
	private MyUtil myUtil;

	// sp1의 블로그 참조할 것
	// {orderNum} : 템플릿 변수
	// @GetMapping("{orderNum}/orderDetail")

	@GetMapping("addrList")
	public String addrList(Model model, HttpSession session) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Long memberNum = info.getMemberNum();

		List<Home> addr = homeservice.listAddr(memberNum);

		model.addAttribute("addr", addr);

		return ".mypage.addrList";
	}

	@RequestMapping(value = "addrWrite", method = RequestMethod.POST)
	public String write(MyPage dto, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertAddr(dto);
		} catch (Exception e) {
		}

		return "redirect:/mypage/addrList";
	}

	@RequestMapping(value = "addrDelete")
	public String delete(@RequestParam Long addressNum, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

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

		List<MyPage> list = service.listMyPage(map);

		String query = "";
		String listUrl = cp + "/mypage/orderList";
		String articleUrl = cp + "/mypage/orderDetail?page=" + current_page;

		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".mypage.orderList";
	}

	@GetMapping("myhome")
	public String myhomeList(@RequestParam(value = "page", defaultValue = "1") int current_page, HttpServletRequest req,
			HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		int membership = info.getMembership();

		if (membership != 1 && membership != 99) {
			return ".home.home";
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());


		List<MyPage> list = service.listMyHome(map);
		MyPage dto = service.readMyhome(info.getUserId());

		model.addAttribute("list", list);
		model.addAttribute("dto", dto);

		return ".mypage.myhome";

	}

	@RequestMapping(value = "orderDetail")
	public String orderDetail(@RequestParam long num, @RequestParam String page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req, HttpSession session, Model model) throws Exception {

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		MyPage dto = service.readOrderDetail(num);
		List<MyPage> list = service.listOrderDetail(num);
		Coupon couponInfo = couponService.couponInfo(num);

		model.addAttribute("detailList", list);
		model.addAttribute("detailList2", dto);
		model.addAttribute("couponInfo", couponInfo);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".mypage.orderDetail";
	}

	@RequestMapping(value = "reviewSubmit", method = RequestMethod.POST)
	public String reviewSubmit(@RequestParam("orderNum") long orderNum, @RequestParam String page,
			@RequestParam("restaurantNum") long restaurantNum, MyPage dto,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpSession session, Model model)
			throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "review";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);


		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.insertReview(dto, pathname);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return "redirect:/mypage/orderList?page=" + page;

	}

	@RequestMapping(value = "reviewUpdate", method = RequestMethod.POST)
	public String reviewUpdateSubmit(@RequestParam("orderNum") long orderNum,
			@RequestParam("restaurantNum") long restaurantNum, @RequestParam String page, 
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			MyPage dto, HttpSession session, Model model)
			throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "review";

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.updateReview(dto, pathname);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return "redirect:/mypage/orderList?page=" + page;

	}

	@RequestMapping(value = "reviewList")
	public String reviewList(@RequestParam("orderNum") long orderNum, HttpServletRequest req, HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());

		List<MyPage> revlist = service.listReview(map);

		model.addAttribute("revlist", revlist);

		return ".mypage.orderList";
	}

	@RequestMapping(value = "likeList")
	public String likeList(HttpServletRequest req, HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<MyPage> likelist = likeservice.likeList(info.getUserId());

		model.addAttribute("likelist", likelist);

		return ".mypage.likeList";
	}

	@RequestMapping(value = "coupon")
	public String couponList(HttpServletRequest req, HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<MyPage> couponlist = couponService.couponList(info.getUserId());

		model.addAttribute("couponlist", couponlist);

		return ".mypage.coupon";
	}

	@RequestMapping(value = "orderUpdate", method = RequestMethod.POST)
	public String orderUpdate(@RequestParam("orderNum") long orderNum, Order dto, HttpSession session, Model model)
			throws Exception {
		try {
			service.updateOrder(dto);
			service.updatePay(dto);
		} catch (Exception e) {
		}

		return "redirect:/mypage/orderList";

	}

}
