package kr.co.rice.mapper;

import kr.co.rice.vo.UserVo;
import kr.co.rice.vo.locationVo;

public interface UserMapper {
    public void user_input_ok(UserVo uvo);

    public int Naver_Id_Check(String naveremail);

    public int idcheck(String email, String naveremail);

    public UserVo pwd_check(String email, String pwd);

    public String pwdcheck(String pwd);

    public int emailcheck(String email);

    public UserVo userview(String email);

    public UserVo userview2(String naveremail);

    public String locheck(String email);

    public String locheck2(String naveremail);

    public locationVo locationview(String email);

    public locationVo locationview2(int user_id);

    public void userup(locationVo lvo);

    public locationVo getuserid(String naveremail);

    public locationVo getuserid2(String email);

    public void addressup(locationVo lvo);

    public void pwdchg(String email, String encoderPwd);

    public void delete(int userid);

    public void lodelete(int userid);
}
