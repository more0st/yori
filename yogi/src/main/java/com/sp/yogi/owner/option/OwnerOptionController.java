package com.sp.yogi.owner.option;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("owner.option.ownerOptionController")
@RequestMapping("/owner/option/*")
public class OwnerOptionController {
	
	@RequestMapping(value = "menuList", method = RequestMethod.GET)
	public String menuList() throws Exception {
		
		return ".owner.option.menuList";
	}
	
	@RequestMapping(value = "optionReg", method = RequestMethod.GET)
	public String optionReg() throws Exception {
		
		return ".owner.option.optionReg";
	}
}
