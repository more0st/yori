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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			HttpServletRequest req,
			Model model
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
	
		String categoryNum = req.getParameter("categoryNum");
		
		// 로그인 안되어있는 상태면 로그인 창으로 이동
		if(info == null) {
			return ".member.login";
		}
		
		if(addr1 != null) {
			info.setDeliveryAddr(addr1);
			
			addr1 = service.extractAddress(addr1);

			info.setAddr1(addr1);
		}
		
		model. addAttribute("categoryNum", categoryNum);
		model.addAttribute("member", info);
		
		model.addAttribute("condition", condition);
		
		return ".restaurant.restaurant-list";
	}
	
	@GetMapping("search")
	@ResponseBody
	public Map<String, Object> search(HttpSession session, 
			@RequestParam(value= "addr1", required = false) String addr1,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}
		
		String categoryNum = req.getParameter("categoryNum");
		
		// 로그인 안되어있는 상태면 로그인 창으로 이동
		if(info == null) {
			resultMap.put("error", "로그인이 필요합니다.");
			return resultMap;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("addr1", info.getAddr1());
		map.put("categoryNum", categoryNum);
		
		List<Restaurant> list = service.listRestaurant(map);
		
		for(Restaurant i : list) {
			if(i.getRating() == null) {
				i.setRating(0.0);
			}
		}
		
		resultMap.put("categoryNum", categoryNum);
		resultMap.put("list", list);
		resultMap.put("member", info);
		resultMap.put("condition", condition);
		resultMap.put("keyword", keyword);
		
		return resultMap;
	}
	
	@GetMapping("info")
	public String info(
			@RequestParam("restaurantNum") Long restaurantNum,
			HttpSession session, 
			HttpServletRequest req,
			Model model
			) throws Exception  {
		RestaurantInfo restaurantInfo = service.readRestaurantInfo(restaurantNum);
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		// 찜
		Map<String, Object> map = new HashMap<String, Object>();
		String userId = info.getUserId();
		map.put("userId", userId);
		map.put("restaurantNum", restaurantNum);
		boolean likeStatus = service.isLike(map);
		
		// 배달팁, 메뉴개수, 리뷰개수
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("restaurantNum", restaurantNum);
		map2.put("addr", info.getAddr1());
		Restaurant restaurantInfo2 = service.readRestaurantInfo2(map2);
		
		// 리뷰 리스트
		List<Review> reviewList = service.readReivew(restaurantNum);
		
		// 별점
		double rating = service.readRating(restaurantNum);
		restaurantInfo2.setRating(rating);
		
		
		/* 메뉴 카테고리 */
		List<Category> categoryList = service.readCategory(restaurantNum);
		for(Category c : categoryList) {
			c.setMenuList(service.readMenu(restaurantNum));
		}
		
		
		model.addAttribute("restaurantNum", restaurantNum);
		model.addAttribute("restaurantInfo", restaurantInfo);
		model.addAttribute("restaurantInfo2", restaurantInfo2);
		model.addAttribute("likeStatus", likeStatus);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("categoryList", categoryList);
		
		return ".restaurant.restaurant-info";
	}
	
	@PostMapping("like")
	@ResponseBody
	public Map<String, Object> like(
			HttpSession session, 
			HttpServletRequest req,
			Model model
			) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String userId = info.getUserId();
		Long restaurantNum = Long.parseLong(req.getParameter("restaurantNum"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("restaurantNum", restaurantNum);
		
		boolean state = service.insertLike(map);
		
		
		resultMap.put("state", state);
		return resultMap;
	}
	
}
