package kr.co.rice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.rice.mapper.UserMapper;
import kr.co.rice.vo.UserVo;

@Service
@Qualifier("us")
public class UserServiceImpl implements UserService{
	
	@Autowired(required = false)
	private UserMapper mapper;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public String user_input_ok(UserVo uvo, HttpServletRequest request, Model model)
	{
		String pwd = request.getParameter("pwd").toString();
		String encoderPwd = passwordEncoder.encode(pwd);
		uvo.setPwd(encoderPwd);
		
		mapper.user_input_ok(uvo);

		return "redirect:/";
	}
	
		

	@Override
	public String sign_up(HttpServletRequest request) {
		
		String email = request.getParameter("email");
		String naveremail = request.getParameter("naveremail");
		
		if(naveremail.equals("null"))
			naveremail= "1";
		
		System.out.println(naveremail);
		
		int idcheck = mapper.idcheck(email,naveremail);
		
		System.out.println(idcheck);
		
		if(idcheck >= 1 )
		{
			return "/users/signinpwd";
		}
		else {
			return "/users/signup";
		}
		
		
	}
	
	@Override
	public String signinok(HttpServletRequest request, HttpSession session)
	{
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		String pwd2 = mapper.pwdcheck(email);
		
		// 비밀번호 복호화
		if(encoder.matches(pwd, pwd2))
		{
			UserVo uvo = mapper.pwd_check(email, pwd2);
			if(uvo == null)
			{
				return "redirect:/users/signin?chk=1";
			}
			else
			{
				session.setAttribute("sessionemail", uvo.getEmail());
				session.setAttribute("sessionname", uvo.getName());
				return "redirect:/";
			}
			
		}
		
		else
		{
			return "redirect:/users/signin";
		}
		
		
		
	}


}
