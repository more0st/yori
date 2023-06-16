package com.sp.yogi.restaurant;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("restaurant.restaurantController")
@RequestMapping("/restaurant/*")
public class RestaurantController {

	@GetMapping("list")
	public String list() {
		
		return ".restaurant.restaurant-list";
	}
	
	@GetMapping("info")
	public String info() {
		
		return ".restaurant.restaurant-info";
	}
}
