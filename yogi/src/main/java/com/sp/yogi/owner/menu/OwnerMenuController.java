package com.sp.yogi.owner.menu;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.yogi.member.SessionInfo;
import com.sp.yogi.owner.market.MarketService;

@Controller("owner.menu.ownerMenuController")
@RequestMapping("/owner/menu/*")
public class OwnerMenuController {
	
	@Autowired
	private MenuService service;
	
	@Autowired
	private MarketService marketService;
	
	@RequestMapping(value = "menuCategory", method = RequestMethod.GET)
	public String menuCategory(HttpSession session, Model model) throws Exception {
		
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/owner/home";
		}
		
		String userId=info.getUserId();
		long restaurantNum=marketService.readRestaurant2(userId).getRestaurantNum();
		int categoryCount=service.categoryCount(restaurantNum);
		List<Menu> categoryList=service.categoryList(restaurantNum);
		
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("categoryCount",categoryCount);
		model.addAttribute("restaurantNum",restaurantNum);
		
		return ".owner.menu.menuCategory";
	}
	
	//카테고리 추가
	@RequestMapping(value = "insertCategory", method = RequestMethod.POST)
	public String insertCategory(
			@RequestParam("menuCategory")String menuCategory, 
			@RequestParam("restaurantNum")long restaurantNum, 
			Menu dto, Model model) throws Exception{
		
		try {
			
			dto.setMenuCategory(menuCategory);
			dto.setRestaurantNum(restaurantNum);
			service.insertCategory(dto);
			
			model.addAttribute("dto", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/owner/menu/menuCategory";
	}

	//카테고리 삭제
	@RequestMapping(value = "deleteCategory", method = RequestMethod.POST)
	public String deleteCategory(
			@RequestParam("num") long num, 
			Menu dto, Model model) throws Exception{
		
		try {
			
			//service.deleteCategory(num);
			
			model.addAttribute("dto", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/owner/menu/menuCategory";
	}
	
	
	
	@RequestMapping(value = "menuDetail", method = RequestMethod.GET)
	public String menuDetail() throws Exception {
		
		return ".owner.menu.menuDetail";
	}
}
