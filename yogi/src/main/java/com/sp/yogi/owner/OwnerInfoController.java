package com.sp.yogi.owner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.yogi.member.SessionInfo;
import com.sp.yogi.owner.register.ResRegister;
import com.sp.yogi.owner.register.ResRegisterService;

@Controller("owner.ownerInfoController")
@RequestMapping("/owner/info/*")
public class OwnerInfoController {
	@Autowired
	private ResRegisterService service;
	
	@Autowired
	private OwnerService service2;
	
	@RequestMapping(value = "check", method = RequestMethod.GET)
	public String check() {
		
		return ".owner.info.check";
	}
	
	@RequestMapping(value = "check", method = RequestMethod.POST)
	public String checkSubmit() {
		
		return ".owner.info.check";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(
			@RequestParam("status") int status,
			Model model,
			HttpSession session
			) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		System.out.println("스테이터스 :" + status);
		
		if(status == 0) {
			// 정보를 불러오고 update로 해주기
			Owner dto = service2.readRestaurant(info.getUserId());
			
			model.addAttribute("dto", dto);
			model.addAttribute("mode", "update");
			return ".owner.info.register";
		}
		
		model.addAttribute("mode", "member");
		
		return ".owner.info.register";
	}
	
	
	// 입점 업체 등록
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerSubmit(ResRegister dto, final RedirectAttributes reAttr, Model model, HttpSession session) {
		
		try {
			// 세션에 로그인 정보 저장
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			Owner owner = service2.readOwner(info.getUserId());
			dto.setRestaurantNum(owner.getRestaurantNum());
			
			service.insertResRegister(dto);
			
			// 업체 입점 상태 : 입점대기(2)로 변경
			service.updateStatus(info.getUserId());
			
			//int status = service2.readStatus(info.getUserId());
			// reAttr.addFlashAttribute("status", status);
		} catch (DuplicateKeyException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "이미 존재하는 업체 번호입니다.");
			return ".owner.login";
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "입점문의가 실패했습니다.");
			return ".owner.login";
		}
		
		// 리다이렉트된 페이지에 값 넘기기
		reAttr.addFlashAttribute("message", "승인 대기중");
		reAttr.addFlashAttribute("status", 2);
				
		return "redirect:/owner/info/afterRegister";
	}
	
   @RequestMapping(value = "afterRegister", method = RequestMethod.GET)
   public String afterRegister(@ModelAttribute("message") String message,@ModelAttribute("message") String status) {
      
      return ".owner.info.afterRegister";
   }
   
   
// 입점 업체 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(ResRegister dto, final RedirectAttributes reAttr, Model model, HttpSession session) {
		
		try {
			// 세션에 로그인 정보 저장
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			System.out.println("업데이트");
			
			Owner owner = service2.readOwner(info.getUserId());
			dto.setRestaurantNum(owner.getRestaurantNum());
			
			service.updateResRegister(dto);
			
			// 업체 입점 상태 : 입점대기(2)로 변경
			service.updateStatus(info.getUserId());
			
			//int status = service2.readStatus(info.getUserId());
			// reAttr.addFlashAttribute("status", status);
		} catch (DuplicateKeyException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "이미 존재하는 업체 번호입니다.");
			return ".owner.login";
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "입점문의가 실패했습니다.");
			return ".owner.login";
		}
		
		// 리다이렉트된 페이지에 값 넘기기
		reAttr.addFlashAttribute("message", "승인 대기중");
		reAttr.addFlashAttribute("status", 2);
				
		return "redirect:/owner/info/afterRegister";
	}
}
