package com.sp.yogi.owner.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	//카테고리명 수정
	@RequestMapping(value = "updateCategory", method = RequestMethod.POST)
	public String updateCategory(
			@RequestParam("num") long num, 
			@RequestParam("menuCategory") String menuCategory, 
			Menu dto, Model model) throws Exception{
		
		try {
			dto.setNum(num);
			dto.setMenuCategory(menuCategory);
			
			service.updateCategory(dto);
			model.addAttribute("dto", dto);
			model.addAttribute("categoryNum",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/owner/menu/menuCategory";
	}

	//카테고리 활성화변경
	@RequestMapping(value = "updateEnabled", method = RequestMethod.POST)
	public String updateEnabled(
			@RequestParam("num") long num, 
			@RequestParam("enabled") int enabled, 
			Menu dto, Model model) throws Exception{
		
		try {
			dto.setNum(num);
			dto.setEnabled(enabled);
			
			service.updateEnabled(dto);
			model.addAttribute("dto", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/owner/menu/menuCategory";
	}
	
	
	
	
	@RequestMapping(value = "menuDetail", method = RequestMethod.GET)
	public String menuDetail(HttpSession session, @RequestParam("num") long num, Model model) throws Exception {
		
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/owner/home";
		}
		
		long restaurantNum=marketService.readRestaurant2(info.getUserId()).getRestaurantNum();
		
		List<Menu> menuList=service.menuList(num);
		int menuCount=service.menuCount(num);
		List<Menu> categoryList= service.categoryList(restaurantNum);
		String categoryName=service.categoryName(num);
		
		model.addAttribute("categoryNum",num);
		model.addAttribute("menuList",menuList);
		model.addAttribute("menuCount",menuCount);
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("categoryName",categoryName);
		
		return ".owner.menu.menuDetail";
	}
	
	//메뉴 stock 수정
	@RequestMapping(value = "updateStock", method = RequestMethod.POST)
	public String updateStock(
			@RequestParam("stock") int stock, 
			@RequestParam("menuNum") long menuNum, Model model) throws Exception{
		
		try {
			
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("stock", stock);
			map.put("menuNum", menuNum);
					
			
			service.updateStock(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/owner/menu/menuCategory";
	}
}
