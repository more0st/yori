package com.sp.yogi.owner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.yogi.owner.register.ResRegister;
import com.sp.yogi.owner.register.ResRegisterService;

@Controller("owner.ownerInfoController")
@RequestMapping("/owner/info/*")
public class OwnerInfoController {
	@Autowired
	private ResRegisterService service;
	
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
	
	
	// 입점 업체 등록
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerSubmit(ResRegister dto, final RedirectAttributes reAttr, Model model) {
		
		try {
			service.insertResRegister(dto);
		} catch (DuplicateKeyException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "이미 존재하는 업체 번호입니다.");
			return ".owner.login";
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "입점문의가 실패했습니다.");
			return ".owner.login";
		}
		
		// StringBuilder sb = new StringBuilder();
		// sb.append(dto.getRestaurantName() + " 매장의 입점 신청이 정상적으로 처리되었습니다.<br>");
		
		// 리다이렉트된 페이지에 값 넘기기
		// reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("message", "승인 대기중");
		reAttr.addFlashAttribute("status", "2");
				
		return "redirect:/owner/info/afterRegister";
	}
	
   @RequestMapping(value = "afterRegister", method = RequestMethod.GET)
   public String afterRegister(@ModelAttribute("message") String message,@ModelAttribute("message") String status) {
      
      return ".owner.info.afterRegister";
   }
}
