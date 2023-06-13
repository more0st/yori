package com.sp.yogi.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("member.memberController")
@RequestMapping("/member/*")
public class MemberController {
	
	@GetMapping("login")
	public String login() {
		
		return "member/login";
	}
	
	@GetMapping("member")
	public String member() {
		
		return "member/member";
	}
	
	@GetMapping("choice")
	public String choice() {
		
		return "member/memberchoice";
	}
}
