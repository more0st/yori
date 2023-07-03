package com.sp.yogi.owner.option;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.yogi.member.SessionInfo;
import com.sp.yogi.owner.market.MarketService;
import com.sp.yogi.owner.menu.Menu;
import com.sp.yogi.owner.menu.MenuService;

@Controller("owner.option.ownerOptionController")
@RequestMapping("/owner/option/*")
public class OwnerOptionController {
	
	@Autowired
	private MenuService service;
	
	@Autowired
	private MarketService marketService;
	
	
	@RequestMapping(value = "menuList", method = RequestMethod.GET)
	public String menuList(HttpSession session, Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/owner/home";
		}
		
		long restaurantNum=marketService.readRestaurant2(info.getUserId()).getRestaurantNum();
		
		List<Menu> categoryList=service.categoryList(restaurantNum);
		
		for(Menu menu : categoryList) {
			menu.setMenuList(service.menuList(menu.getNum()));
		}
		
		model.addAttribute("categoryList",categoryList);
		
		return ".owner.option.menuList";
	}
	
	@RequestMapping(value = "optionReg", method = RequestMethod.GET)
	public String optionReg(@RequestParam long menuNum, Model model) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		
		List<Menu> optionGroup= service.optionGroup(menuNum);
		for(Menu menu : optionGroup) {
			map.put("menuNum", menu.getMenuNum());
			map.put("option_group", menu.getOption_group());
			menu.setOptionList(service.optionNameList(map));
			map.clear();
		}
		
		model.addAttribute("optionList",optionGroup);
		model.addAttribute("menuNum",menuNum);
		
		return ".owner.option.optionReg";
	}
	
	//옵션추가
	@RequestMapping(value = "insertOption", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertOption(Menu dto) throws Exception{
		
		String state = "true";
		try {
			service.insertOption(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
}
