package com.sp.yogi.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("member.memberController")
@RequestMapping("/member/*")
public class MemberController {
	
	@GetMapping("login")
	public String login() {
		
		return ".member.login";
	}
	
	@GetMapping("check")
	public String check() {
		
		return ".member.check";
	}
	
	@PostMapping("check")
	public String checkSubmit() {
		
		return ".member.check";
	}
	
	@GetMapping("member")
	public String member() {
		
		return ".member.member";
	}
	
	@PostMapping("member")
	public String memberSubmit() {
		
		return ".member.member";
	}
	
	@GetMapping("choice")
	public String choice() {
		
		return ".member.memberchoice";
	}

	@GetMapping("findId")
	public String findId() {
		
		return ".member.findId";
	}

	@GetMapping("findPwd")
	public String findPwd() {
		
		return ".member.findPwd";
	}
}
