package kr.co.rice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String login()
	{
		return "/login/login";
	}
	
	@RequestMapping("/agree")
	public String agree()
	{
		return "/login/member_input";
	}
	
	@RequestMapping("/member_input")
	public String member_input()
	{
		return "/login/member_input";
	}
}
