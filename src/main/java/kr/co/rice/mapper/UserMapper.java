package kr.co.rice.mapper;

import kr.co.rice.vo.UserVo;

public interface UserMapper {
	public void user_input_ok(UserVo uvo);
	public int Naver_Id_Check(String naveremail);
	public int idcheck(String email,String naveremail);
	public UserVo pwd_check(String email, String pwd);
	public String pwdcheck(String pwd);
	
}
