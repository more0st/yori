package com.sp.yogi.owner.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.yogi.member.SessionInfo;

@Controller("owner.order.ownerOrderController")
@RequestMapping("/owner/order/*")
public class OwnerOrderController {
	
	@Autowired
	private OrderService service;
	
	@RequestMapping(value = "orderList", method = RequestMethod.GET)
	public String list(HttpSession session, Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/owner/home";
		}
		
		Order res=service.readResNum(info.getUserId());
		List<Order> orderList=service.orderList(res.getRestaurantNum());
		/*
		for(Order order : orderList) {
			Long orderNum=order.getOrderNum();
			order.setMenuList(service.orderMenuList(orderNum));
		}
		*/
		
		model.addAttribute("orderList",orderList);
		model.addAttribute("res",res);
		model.addAttribute("userId",info.getUserId());
		
		return ".owner.order.orderList";
	}
	@RequestMapping(value = "orderDetail", method = RequestMethod.GET)
	public String orderDetail() throws Exception {
		
		return ".owner.order.orderDetail";
	}
}
