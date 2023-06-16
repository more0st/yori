package com.sp.yogi.owner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("owner.ownerInfoController")
@RequestMapping("/owner/info/*")
public class OwnerInfoController {
	@RequestMapping(value = "check", method = RequestMethod.GET)
	public String check() {
		
		return ".owner.info.check";
	}
	
	@RequestMapping(value = "check", method = RequestMethod.POST)
	public String checkSubmit() {
		
		return ".owner.info.check";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register() {
		
		return ".owner.info.register";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerSubmit() {
		
		return ".owner.info.register";
	}
	
   @RequestMapping(value = "afterRegister", method = RequestMethod.GET)
   public String afterRegister() {
      
      return ".owner.info.afterRegister";
   }
}
