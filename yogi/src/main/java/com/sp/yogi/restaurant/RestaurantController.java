package com.sp.yogi.restaurant;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yogi.member.SessionInfo;

@Controller("restaurant.restaurantController")
@RequestMapping("/restaurant/*")
public class RestaurantController {

	@GetMapping("list")
	public String list(HttpSession session) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info == null) {
			
			return ".member.login";
		}
		
		return ".restaurant.restaurant-list";
	}
	
	@GetMapping("info")
	public String info() {
		
		return ".restaurant.restaurant-info";
	}
}
