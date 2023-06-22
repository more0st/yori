package com.sp.yogi.owner.market;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("owner.market.ownerMarketController")
@RequestMapping("/owner/market/*")
public class OwnerMarketController {
	
	@RequestMapping(value = "marketinfo", method = RequestMethod.GET)
	public String marketinfo() {
		
		return ".owner.market.marketinfo";
	}

	@RequestMapping(value = "marketinfo", method = RequestMethod.POST)
	public String marketSubmit() {
		
		try {
			
		} catch (Exception e) {
		}
		
		
		return ".owner.market.marketinfo";
	}
	
	@RequestMapping(value = "review", method = RequestMethod.GET)
	public String review() {
		
		return ".owner.market.review";
	}
}
