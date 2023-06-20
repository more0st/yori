package com.sp.yogi.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.myPageController")
@RequestMapping("/mypage/*")
public class MyPageController {
	
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
	public String addrList() {
		return ".mypage.addrList";
	}
}
