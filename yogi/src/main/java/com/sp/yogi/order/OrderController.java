package com.sp.yogi.order;

import java.util.HashMap;
import java.util.Map;

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
import com.sp.yogi.restaurant.RestaurantInfo;
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
//			, @RequestParam("deliveryFee") int deliveryFee
			) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String userId = info.getUserId();
		
		Member dto = memberservice.readMember(userId);
		
		RestaurantInfo restaurant = restaurantService.readRestaurantInfo(restaurantNum);
		
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("dto", dto);
//		model.addAttribute("deliveryFee", deliveryFee);
		
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		Order dto = new Order();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		// 어트리뷰트로 띄어주기 위한 레스토랑 객체
		System.out.println("레스토랑 : " + restaurantNum);
		RestaurantInfo restaurant = restaurantService.readRestaurantInfo(restaurantNum);
		
		Member orderUser = memberservice.readMember(info.getUserId());
		
		int total_price = 0; // 전체 금액
		
		// 주문번호 생성
		String productOrderNumber = null; // 주문번호
		productOrderNumber = orderservice.productOrderNumber();
		Long orderNum = Long.parseLong(productOrderNumber);
		System.out.println("주문번호 : " + productOrderNumber);
		
		// insert할 정보 map에 넣어주기
		map.put("memo", memo);
		map.put("addr1", info.getAddr1());
		map.put("addr2", addr2);
		map.put("tel", tel);
		map.put("userId", info.getUserId());
		map.put("restaurantNum", restaurantNum);
		if(payment.equals("cash")) {
			map.put("payMethod", "만나서 결제");
		} else {
			map.put("payMethod", "카드 결제");
		}
		map.put("orderNum", orderNum);
		
		// 어트리뷰트로 띄어줄 객체
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
		dto.setOrderNum(orderNum);
		
		// jsp에 어트리뷰트 저장 
		model.addAttribute("dto", dto);
		model.addAttribute("restaurant", restaurant);
		
		// 리다이렉트
		return ".order.orderComplete";
	}
}
