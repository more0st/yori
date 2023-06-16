package com.sp.yogi.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("order.memberController")
@RequestMapping("/order/*")
public class OrderController {
	
	@GetMapping("order")
	public String order() {
		
		return ".order.order";
	}
	
	@GetMapping("complete")
	public String complete() {
		
		return ".order.orderComplete";
	}
}
