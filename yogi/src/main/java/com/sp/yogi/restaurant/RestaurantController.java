package com.sp.yogi.restaurant;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yogi.member.SessionInfo;

@Controller("restaurant.restaurantController")
@RequestMapping("/restaurant/*")
public class RestaurantController {
	
	@Autowired
	RestaurantService service;

	@GetMapping("list")
	public String list(HttpSession session, 
			@RequestParam(value= "addr1", required = false) String addr1,
			Model model
			) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		// 로그인 안되어있는 상태면 로그인 창으로 이동
		if(info == null) {
			return ".member.login";
		}
		
		// 배달지 선택 안했을 경우.
		
		
		if(addr1 != null) {
			info.setDeliveryAddr(addr1);
			
			addr1 = service.extractAddress(addr1);
			
			info.setAddr1(addr1);
			// System.out.println(addr1);					// >> addr1 : 강남구 신사동
			// System.out.println(info.getDeliveryAddr());	// >> deliveryAddr : 서울 강남구 가로수길 5 (신사동)
		}
		System.out.println(info.getAddr1());
		model.addAttribute("member", info);
		
		return ".restaurant.restaurant-list";
	}
	
	@GetMapping("info")
	public String info() {
		
		return ".restaurant.restaurant-info";
	}
}
