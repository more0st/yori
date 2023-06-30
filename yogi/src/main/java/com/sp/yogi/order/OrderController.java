package com.sp.yogi.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			@RequestParam("restaurantNum") Long restaurantNum,
			@RequestParam("deliveryFee") int deliveryFee,
			@RequestParam("totalPrice") int total_price,
			@RequestParam("menuNums") String menuNums,
			@RequestParam("menuOptions") String menuOptions,
			@RequestParam("menuQuantities") String menuQuantities,
			@RequestParam("menuPrices") String menuPrices,
			@RequestParam("menuNames") String menuNames
			) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String userId = info.getUserId();
		
		Member dto = memberservice.readMember(userId);
		
		RestaurantInfo restaurant = restaurantService.readRestaurantInfo(restaurantNum);
		
		total_price += deliveryFee;
		
		List<Order> orderList = new ArrayList<Order>();
		
		String [] menuNumsArr = menuNums.split(",");
		String [] menuNamesArr = menuNames.split(",");
		String [] menuOptionsArr = menuOptions.split("-");
		String [] menuQuantitiesArr = menuQuantities.split(",");
		String [] menuPricesArr = menuPrices.split(",");
		
		for(int i = 0; i < menuNumsArr.length; i++) {
			Order order = new Order();
			
			order.setMenuNum(Long.parseLong(menuNumsArr[i]));
			order.setMenu(menuNamesArr[i]);
			order.setOptionName(menuOptionsArr[i]);
			order.setMenuPrice(Integer.parseInt(menuPricesArr[i]));
			order.setOrderCount(Integer.parseInt(menuQuantitiesArr[i]));
			
			orderList.add(order);
		}
		
		model.addAttribute("menuNums", menuNums);
		model.addAttribute("menuOptions", menuOptions);
		model.addAttribute("menuQuantities", menuQuantities);
		model.addAttribute("menuPrices", menuPrices);
		model.addAttribute("menuNames", menuNames);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("dto", dto);
		model.addAttribute("deliveryFee", deliveryFee);
		model.addAttribute("total_price", total_price);
		
		return ".order.order";
	}
	
	@GetMapping("complete")
	public String complete(
			Model model,
			@ModelAttribute("dto") Order dto,
			@ModelAttribute("orderList") List<Order> orderList,
			@ModelAttribute("orderUser") Member orderUser,
			@ModelAttribute("restaurant") RestaurantInfo restaurant,
			@ModelAttribute("deliveryFee") int deliveryFee
			) {
		System.out.println("GET방식");
		
		// jsp에 어트리뷰트 저장 
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderUser", orderUser);
		model.addAttribute("dto", dto);
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("deliveryFee", deliveryFee);
		
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
			@RequestParam("restaurantNum") Long restaurantNum,
			@RequestParam("deliveryFee") int deliveryFee,
			@RequestParam("total_price") int total_price,
			@RequestParam("menuNums") String menuNums,
			@RequestParam("menuOptions") String menuOptions,
			@RequestParam("menuQuantities") String menuQuantities,
			@RequestParam("menuPrices") String menuPrices,
			@RequestParam("menuNames") String menuNames,
			RedirectAttributes reAttr
			) throws Exception {
		System.out.println("POST방식");
		
		Map<String, Object> map = new HashMap<String, Object>();
		Order dto = new Order();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		// 어트리뷰트로 띄어주기 위한 레스토랑 객체
		System.out.println("레스토랑 : " + restaurantNum);
		RestaurantInfo restaurant = restaurantService.readRestaurantInfo(restaurantNum);
		
		Member orderUser = memberservice.readMember(info.getUserId());
		
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
		map.put("total_price", total_price);
		map.put("price", total_price);
		
		List<Order> orderList = new ArrayList<Order>();
		
		String [] menuNumsArr = menuNums.split(",");
		String [] menuNamesArr = menuNames.split(",");
		String [] menuOptionsArr = menuOptions.split("-");
		String [] menuQuantitiesArr = menuQuantities.split(",");
		String [] menuPricesArr = menuPrices.split(",");
		
		for(int i = 0; i < menuNumsArr.length; i++) {
			Order order = new Order();
			
			order.setOrderNum(orderNum);
			order.setMenuNum(Long.parseLong(menuNumsArr[i]));
			order.setMenu(menuNamesArr[i]);
			order.setOptionName(menuOptionsArr[i]);
			order.setMenuPrice(Integer.parseInt(menuPricesArr[i]));
			order.setOrderCount(Integer.parseInt(menuQuantitiesArr[i]));
			
			orderList.add(order);
		}

//		Order order = new Order();
//		order.setOptionName("배달 요금");
//		order.setMenuPrice(deliveryFee);
//		
//		orderList.add(order);
		
		try {
			orderservice.insertOrder(map, orderList);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
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
		dto.setTotal_price(String.valueOf(total_price));
		
		reAttr.addFlashAttribute("orderList", orderList);
		reAttr.addFlashAttribute("orderUser", orderUser);
		reAttr.addFlashAttribute("dto", dto);
		reAttr.addFlashAttribute("restaurant", restaurant);
		reAttr.addFlashAttribute("deliveryFee", deliveryFee);
		
		// 리다이렉트
		return "redirect:/order/complete";
	}
}
