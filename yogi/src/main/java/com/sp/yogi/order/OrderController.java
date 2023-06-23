package com.sp.yogi.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yogi.member.SessionInfo;

@Controller("order.orderController")
@RequestMapping("/order/*")
public class OrderController {
	@Autowired
	private OrderService service;
	
	@GetMapping("order")
	public String order(HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String userId = info.getUserId();
		
		Order dto = service.readMember(userId);
		
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
			@RequestParam String addr2
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
		
		model.addAttribute("dto", dto);
		
		return ".order.orderComplete";
	}
}
