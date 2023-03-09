package kr.co.rice.service;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.rice.vo.UserVo;

public interface UserService {
	public String user_input_ok(UserVo uvo, HttpServletRequest request, Model model);
	public String sign_up(HttpServletRequest request);
	public String signinok(HttpServletRequest request, HttpSession session);
	
}
