package com.sp.yogi.owner.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("owner.order.ownerOrderController")
@RequestMapping("/owner/order/*")
public class OwnerOrderController {
	
	@RequestMapping(value = "orderList", method = RequestMethod.GET)
	public String list() throws Exception {
		
		return ".owner.order.orderList";
	}
	@RequestMapping(value = "orderDetail", method = RequestMethod.GET)
	public String orderDetail() throws Exception {
		
		return ".owner.order.orderDetail";
	}
}
