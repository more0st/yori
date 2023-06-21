package com.sp.yogi.owner;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.yogi.member.SessionInfo;

@Controller("owner.ownerController")
@RequestMapping("/owner/*")
public class OwnerController {
	@Autowired
	private OwnerService service;
	
	@GetMapping("home")
	public String home() {
		
		return ".ownerLayout";
	}
	
	@RequestMapping(value = "member", method = RequestMethod.GET)
	public String ownerForm(Model model) {
		model.addAttribute("mode", "member");
		return ".owner.member";
	}

	@RequestMapping(value = "member", method = RequestMethod.POST)
	public String ownerSubmit(Owner dto, final RedirectAttributes reAttr, Model model) {

		try {
			service.insertOwner(dto);
		} catch (DuplicateKeyException e) {
			// 기본키 중복에 의한 제약 조건 위반
			model.addAttribute("mode", "member");
			model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
			return ".owner.member";
		} catch (DataIntegrityViolationException e) {
			// 데이터형식 오류, 참조키, NOT NULL 등의 제약조건 위반
			model.addAttribute("mode", "member");
			model.addAttribute("message", "제약 조건 위반으로 회원가입이 실패했습니다.");
			return ".owner.member";
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "회원가입이 실패했습니다.");
			return ".owner.member";
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserName() + "님의 회원가입이 완료되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 바랍니다.<br>");

		// 리다이렉트된 페이지에 값 넘기기
		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "회원 가입");

		return "redirect:/owner/complete";
	}

	@RequestMapping(value = "complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {

		// 컴플릿 페이지(complete.jsp)의 출력되는 message와 title는 RedirectAttributes 값이다.
		// F5를 눌러 새로 고침을 하면 null이 된다.

		//if (message == null || message.length() == 0) // F5를 누른 경우
			//return "redirect:/";

		return ".owner.complete";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() {
		return ".owner.login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginSubmit(@RequestParam String userId, @RequestParam String userPwd, HttpSession session,
			Model model) {

		Owner dto = service.loginOwner(userId);
		
		if (dto == null || !userPwd.equals(dto.getUserPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".owner.login";
		}

		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setRestaurantNum(dto.getRestaurantNum());
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		
		Owner owner = new Owner();
		owner = service.readRestaurant(userId);
		
		if(owner == null) {
			session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분
			
			session.setAttribute("member", info);
			
			return ".owner.home";
		}
		info.setRestaurantName(owner.getRestaurantName());

		session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분
		
		session.setAttribute("member", info);
		
		// 로그인 이전 URI로 이동
		/*
		String uri = (String) session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		
		if (uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:" + uri;
		}
		*/
		
		return ".owner.home";
	}

	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 정보 지우기
		session.removeAttribute("member");

		// 세션에 저장된 모든 정보 지우고, 세션초기화
		session.invalidate();

		return ".owner.login";
	}

	@RequestMapping(value = "check", method = RequestMethod.GET)
	public String pwdForm(String dropout, Model model) {

		if (dropout == null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}

		return ".owner.pwdCheck";
	}

	@RequestMapping(value = "check", method = RequestMethod.POST)
	public String pwdSubmit(@RequestParam String userPwd, @RequestParam String mode, final RedirectAttributes reAttr,
			HttpSession session, Model model) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Owner dto = service.readOwner(info.getUserId());
		if (dto == null) {
			session.invalidate();
			return "redirect:/";
		}

		if (!dto.getUserPwd().equals(userPwd)) {
			if (mode.equals("update")) {
				model.addAttribute("mode", "update");
			} else {
				model.addAttribute("mode", "dropout");
			}
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".owner.pwdCheck";
		}

		if (mode.equals("dropout")) {
			// 게시판 테이블등 자료 삭제

			// 회원탈퇴 처리
			/*
			 * Map<String, Object> map = new HashMap<>(); map.put("ownerIdx",
			 * info.getOwnerIdx()); map.put("userId", info.getUserId());
			 */

			// 세션 정보 삭제
			session.removeAttribute("member");
			session.invalidate();

			StringBuilder sb = new StringBuilder();
			sb.append(dto.getUserName() + "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

			reAttr.addFlashAttribute("title", "회원 탈퇴");
			reAttr.addFlashAttribute("message", sb.toString());

			return "redirect:/owner/complete";
		}

		// 회원정보수정폼
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		return ".owner.member";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Owner dto, final RedirectAttributes reAttr, Model model, HttpSession session) {

		try {
			service.updateOwner(dto);
		} catch (Exception e) {
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserName() + "님의 회원정보가 정상적으로 변경되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

		reAttr.addFlashAttribute("title", "회원 정보 수정");
		reAttr.addFlashAttribute("message", sb.toString());
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		session.removeAttribute("member");
		
		Owner owner = service.readOwner(dto.getUserId());
		info.setRestaurantNum(dto.getRestaurantNum());
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		
		Owner owner2 = new Owner();
		owner2 = service.readRestaurant(dto.getUserId());
		
		if(owner2 == null) {
			session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분
			
			session.setAttribute("member", info);
			
			return ".owner.home";
		}
		info.setRestaurantName(owner2.getRestaurantName());

		session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분
		
		session.setAttribute("member", info);
		
		return "redirect:/owner/complete";
	}

	// @ResponseBody : 자바 객체를 HTTP 응답 몸체로 전송(AJAX에서 JSON 전송 등에 사용)
	@RequestMapping(value = "userIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam String userId) throws Exception {

		String p = "true";
		Owner dto = service.readOwner(userId);
		if (dto != null) {
			p = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	// 패스워드 찾기
	@RequestMapping(value="findPwd", method=RequestMethod.GET)
	public String pwdFindForm(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info != null) {
			return "redirect:/";
		}
		
		return ".owner.findPwd";
	}
	
	@RequestMapping(value = "findPwd", method = RequestMethod.POST)
	public String pwdFindSubmit(@RequestParam String userId,
			RedirectAttributes reAttr,
			Model model) throws Exception {
		
		Owner dto = service.readOwner(userId);
		if(dto == null || dto.getEmail() == null || dto.getEnabled() == 0) {
			model.addAttribute("message", "등록된 아이디가 아닙니다.");
			return ".owner.findPwd";
		}
		
		try {
			service.generatePwd(dto);
		} catch (Exception e) {
			model.addAttribute("message", "이메일 전송이 실패했습니다.");
			return ".owner.findPwd";
		}
		
		StringBuilder sb=new StringBuilder();
		sb.append("회원님의 이메일로 임시패스워드를 전송했습니다.<br>");
		sb.append("로그인 후 패스워드를 변경하시기 바랍니다.<br>");
		
		reAttr.addFlashAttribute("title", "패스워드 찾기");
		reAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/owner/findPwdComplete";
	}
	


	@GetMapping("findId")
	public String findId() {

		return ".owner.findId";
	}


}