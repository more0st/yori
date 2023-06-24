package com.sp.yogi.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yogi.member.Member;
import com.sp.yogi.member.MemberService;
import com.sp.yogi.member.SessionInfo;
import com.sp.yogi.restaurant.Restaurant;
import com.sp.yogi.restaurant.RestaurantService;

@Controller("order.orderController")
@RequestMapping("/order/*")
public class OrderController {
	@Autowired
	private OrderService orderservice;
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping("order")
	public String order(HttpSession session, 
			Model model,
			@RequestParam("restaurantNum") Long restaurantNum
			) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String userId = info.getUserId();
		
		Member dto = memberservice.readMember(userId);
		
		Restaurant restaurant = restaurantService.readRestaurantInfo(restaurantNum);
		
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("dto", dto);
		
		return ".order.order";
	}
	
	@GetMapping("complete")
	public String complete() {
		System.out.println("GET방식");
		
		return ".order.orderComplete";
	}
	
	@PostMapping("complete")
	public String completeSubmit( 
			HttpSession session,
			Model model,
			@RequestParam String tel,
			@RequestParam String memo,
			@RequestParam String payment,
			@RequestParam String addr2,
			@RequestParam("restaurantNum") Long restaurantNum
			) {
		System.out.println("POST방식");
		
		Order dto = new Order();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		dto.setUserId(info.getUserId());
		if(payment.equals("cash")) {
			dto.setPayMethod("만나서 결제");
		} else {
			dto.setPayMethod("카드 결제");
		}
		dto.setMemo(memo);
		dto.setAddr1(info.getAddr1());
		dto.setAddr2(addr2);
		dto.setTel(tel);
		
		System.out.println("레스토랑 : " + restaurantNum);
		Restaurant restaurant = restaurantService.readRestaurantInfo(restaurantNum);
		
		Member orderUser = memberservice.readMember(info.getUserId());
		
		String productOrderNumber = null; // 주문번호
		int total_price = 0; // 전체 금액
		
		productOrderNumber = orderservice.productOrderNumber();
		
		Long orderNum = Long.parseLong(productOrderNumber);
		
		Order order = new Order();
		
		order.setOrderNum(orderNum);
		
		System.out.println("주문번호 : " + productOrderNumber);
		
		model.addAttribute("order", order);
		model.addAttribute("dto", dto);
		model.addAttribute("restaurant", restaurant);
		
		return ".order.orderComplete";
	}
}
