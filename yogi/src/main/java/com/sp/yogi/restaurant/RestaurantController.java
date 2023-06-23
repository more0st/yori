package com.sp.yogi.restaurant;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yogi.member.SessionInfo;

@Controller("restaurant.restaurantController")
@RequestMapping("/restaurant/*")
public class RestaurantController {
	
	@Autowired
	RestaurantService service;

	@GetMapping("list")
	public String list(HttpSession session, 
			@RequestParam(value= "addr1", required = false) String addr1,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}
		
		String categoryNum = req.getParameter("categoryNum");
		System.out.println("카테고리 : " + categoryNum);
		
		// 로그인 안되어있는 상태면 로그인 창으로 이동
		if(info == null) {
			return ".member.login";
		}
		
		// 배달지 선택 안했을 경우.
		
		if(addr1 != null) {
			info.setDeliveryAddr(addr1);
			
			addr1 = service.extractAddress(addr1);
			
			info.setAddr1(addr1);
			// System.out.println(addr1);					// >> addr1 : 강남구 신사동
			// System.out.println(info.getDeliveryAddr());	// >> deliveryAddr : 서울 강남구 가로수길 5 (신사동)
		}
		

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("addr1", info.getAddr1());
		map.put("categoryNum", categoryNum);
		
		List<Restaurant> list = service.listRestaurant(map);
		
		for(Restaurant i : list) {
			System.out.println(i.getRestaurantName() + " : 이름");
			System.out.println(i.getCategoryNum() + " : 카테고리2");
		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("member", info);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".restaurant.restaurant-list";
	}
	
	@GetMapping("info")
	public String info() {
		
		return ".restaurant.restaurant-info";
	}
}
