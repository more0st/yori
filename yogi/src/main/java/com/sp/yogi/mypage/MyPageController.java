package com.sp.yogi.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.myPageController")
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@GetMapping("myhome")
	public String myhome() {
		return "mypage/myhome";
	}

	@GetMapping("orderList")
	public String orderList() {
		return "mypage/orderList";
	}
	
	@GetMapping("likeList")
	public String likeList() {
		return "mypage/likeList";
	}
	
	@GetMapping("coupon")
	public String coupon() {
		return "mypage/coupon";
	}
}
