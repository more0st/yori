package com.sp.yogi.owner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("owner.ownerSaleController")
@RequestMapping("/owner/sale/*")
public class OwnerSaleController {
	
	@RequestMapping(value = "saleTime", method = RequestMethod.GET)
	public String saleTime() throws Exception {
		
		return ".owner.sale.saleTime";
	}
	
	@RequestMapping(value = "saleMenu", method = RequestMethod.GET)
	public String saleMenu() throws Exception {
		
		return ".owner.sale.saleMenu";
	}
}
