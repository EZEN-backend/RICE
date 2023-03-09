package kr.co.rice.utils;

import kr.co.rice.vo.UserVo;

public interface NaverCustomUserDetailService {
	
	public UserVo loadUserByUsername(String id);
}
