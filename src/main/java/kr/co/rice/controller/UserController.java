package kr.co.rice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.rice.service.SearchService;
import kr.co.rice.service.UserService;
import kr.co.rice.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	@Qualifier("us")
	private UserService service;
	
	@RequestMapping("users/sign_in")
	public String sign_in()
	{
		return "users/signin";
	}
	
	@RequestMapping("users/agreement")
	public String agreement()
	{
		return "users/agreement";
	}
	
	@RequestMapping("users/signup")
	public String sign_up(HttpServletRequest request)
	{
		return service.sign_up(request);
	}
	
	@RequestMapping("users/userinputok")
	public String user_input_ok(UserVo uvo, HttpServletRequest request, Model model)
	{
		return service.user_input_ok(uvo, request, model);
	}
	
	@RequestMapping("users/signinpwd")
	public String sign_in_pwd()
	{
		return "users/signinpwd";
	}
	
	@RequestMapping("users/signinok")
	public String signinok(HttpServletRequest request, HttpSession session)
	{
		return service.signinok(request, session);
	}
}
