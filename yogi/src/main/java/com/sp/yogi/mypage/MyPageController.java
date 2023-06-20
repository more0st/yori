package com.sp.yogi.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@GetMapping("myhome")
	public String myhome() {
		return ".mypage.myhome";
	}

	@GetMapping("orderList")
	public String orderList() {
		return ".mypage.orderList";
	}
	
	// sp1의 블로그 참조할 것
	// {orderNum} : 템플릿 변수
	// @GetMapping("{orderNum}/orderDetail")
	@GetMapping("orderDetail")
	public String orderDetail() {
		
		return ".mypage.orderDetail";
	}
	
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
}
