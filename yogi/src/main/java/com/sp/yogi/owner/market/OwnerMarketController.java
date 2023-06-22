package com.sp.yogi.owner.market;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.yogi.member.SessionInfo;

@Controller("owner.market.ownerMarketController")
@RequestMapping("/owner/market/*")
public class OwnerMarketController {
	
	@Autowired
	private MarketService service;

	@RequestMapping(value = "marketinfo", method = RequestMethod.GET)
	public String marketSubmit(HttpSession session, Model model) throws Exception{
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		if(info==null) {
			return "redirect:/owner/home";
		}
		
		String userId=info.getUserId();
		
		Market dto=service.readRestaurant2(userId);
		if(dto==null) {
			return "redirect:/owner/home";
		}
		model.addAttribute("dto",dto);
		model.addAttribute("userId",info.getUserId());
		
		return ".owner.market.marketinfo";
	}
	
	@RequestMapping(value = "review", method = RequestMethod.GET)
	public String review() {
		
		return ".owner.market.review";
	}
}
