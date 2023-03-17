package kr.co.rice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.rice.vo.locationVo;
import org.springframework.ui.Model;

import kr.co.rice.vo.UserVo;
	
public interface UserService {
    public String user_input_ok(UserVo uvo, HttpServletRequest request, HttpSession session, Model model);

    public String sign_up(HttpServletRequest request, HttpSession session);

    public String signinok(HttpServletRequest request, HttpSession session);

    public String userview(HttpSession session, Model model, UserVo uvo);

    public String userup(HttpSession session, locationVo lvo);

    public String pwdchg(HttpSession session, HttpServletRequest request);

    public String delete(HttpServletRequest request, HttpSession session);

}
