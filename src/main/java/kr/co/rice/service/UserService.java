package kr.co.rice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.rice.vo.UserVo;

public interface UserService {
	public String user_input_ok(UserVo uvo, HttpServletRequest request, HttpSession session, Model model);
	public String sign_up(HttpServletRequest request, HttpSession session);
	public String signinok(HttpServletRequest request, HttpSession session);
	
}
