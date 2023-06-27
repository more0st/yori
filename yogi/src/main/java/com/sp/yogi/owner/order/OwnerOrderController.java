package com.sp.yogi.owner.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		//메뉴리스트
		for(Order order : orderList) {
			Long orderNum=order.getOrderNum();
			order.setMenuList(service.orderMenuList(orderNum));
		}
		model.addAttribute("openState", info.getOpenState());
		model.addAttribute("orderList",orderList);
		model.addAttribute("res",res);
		model.addAttribute("userId",info.getUserId());
		
		return ".owner.order.orderList";
	}
	@RequestMapping(value = "orderDetail", method = RequestMethod.GET)
	public String orderDetail(@RequestParam("orderNum") long orderNum, @RequestParam("statusName") long statusName, Model model) throws Exception {
		
		int menuCount=service.menuCount(orderNum);
		Order orderInfo=service.orderInfoList(orderNum);
		Order paymentInfo=service.paymentInfo(orderNum);
		List<Order> orderMenu=service.orderMenuList(orderNum);
		
		model.addAttribute("orderNum",orderNum);
		model.addAttribute("statusNum",statusName);
		model.addAttribute("menuCount",menuCount);
		model.addAttribute("orderInfo",orderInfo);
		model.addAttribute("paymentInfo",paymentInfo);
		model.addAttribute("orderMenu",orderMenu);
		
		return ".owner.order.orderDetail";
	}
	
	//주문 접수
	@RequestMapping(value = "updateStatus2", method = RequestMethod.POST)
	public String updateStatus2(@RequestParam("orderNum") long orderNum, 
			Model model) throws Exception{
		
		try {
			service.updateStatus2(orderNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".owner.order.orderList";
	}
	//배달시작
	@RequestMapping(value = "updateStatus3", method = RequestMethod.POST)
	public String updateStatus3(@RequestParam("orderNum") long orderNum, 
			Model model) throws Exception{
		
		try {
			service.updateStatus3(orderNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".owner.order.orderList";
	}
	//배달완료
	@RequestMapping(value = "updateStatus4", method = RequestMethod.POST)
	public String updateStatus4(@RequestParam("orderNum") long orderNum, 
			Model model) throws Exception{
		
		try {
			service.updateStatus4(orderNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".owner.order.orderList";
	}
	//주문 취소
	@RequestMapping(value = "cancelOrder", method = RequestMethod.POST)
	public String cancelOrder(@RequestParam("orderNum") long orderNum,
			@RequestParam("memo") String memo,
			Order dto, 
			Model model) throws Exception{
		
		try {
			dto.setOrderNum(orderNum);
			dto.setMemo(memo);
			
			Order paymentInfo=service.paymentInfo(orderNum);
			
			dto.setPayNum(paymentInfo.getPayNum());
			service.updateStatus5(dto);//상태:취소로 변경
			service.insertRefund(dto);//환불처리
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".owner.order.orderList";
	}
	
}
