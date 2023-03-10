package kr.co.rice.utils;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.rice.vo.UserVo;

public interface NaverLoginService {
	
	public UserVo updateNaver(UserVo user);
	public UserVo naverCheck(UserVo uservo);

}
