package kr.co.rice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.rice.vo.locationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.rice.mapper.UserMapper;
import kr.co.rice.vo.UserVo;

@Service
@Qualifier("us")
public class UserServiceImpl implements UserService {

    @Autowired(required = false)
    private UserMapper mapper;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Override
    public String user_input_ok(UserVo uvo, HttpServletRequest request, HttpSession session, Model model) {
        session = request.getSession();

        String naveremail = (String) session.getAttribute("naveremail");

        if (naveremail == null) {
            String pwd = request.getParameter("pwd").toString();
            String encoderPwd = passwordEncoder.encode(pwd);
            uvo.setPwd(encoderPwd);

            mapper.user_input_ok(uvo);

            return "redirect:/";
        } else {
            mapper.user_input_ok(uvo);
            return "redirect:/";
        }
    }


    @Override
    public String sign_up(HttpServletRequest request, HttpSession session) {

        session = request.getSession();

        String email = request.getParameter("email");
        String naveremail = (String) session.getAttribute("naveremail");

        if (naveremail == null)
            naveremail = "1";

        int idcheck = mapper.idcheck(email, naveremail);

        if (idcheck >= 1) {
            return "/users/signinpwd";
        } else {
            return "/users/signup";
        }


    }

    @Override
    public String signinok(HttpServletRequest request, HttpSession session) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");

        String pwd2 = mapper.pwdcheck(email);

        // 비밀번호 복호화
        if (encoder.matches(pwd, pwd2)) {
            UserVo uvo = mapper.pwd_check(email, pwd2);
            if (uvo == null) {
                return "redirect:/users/signin?chk=1";
            } else {
                session.setAttribute("useremail", uvo.getEmail());
                session.setAttribute("username", uvo.getName());
                return "redirect:/";
            }

        } else {
            return "redirect:/users/signin";
        }
    }

    @Override
    public String userview(HttpSession session, Model model, UserVo uvo) {
        String email = null;
        String naveremail = null;

        Object emailobj = session.getAttribute("useremail");
        Object naveremailobj = session.getAttribute("naveremail");

        if (emailobj != null) {
            email = emailobj.toString();
            UserVo uvo1 = mapper.userview(email);
            locationVo lvo = mapper.locationview(email);

            model.addAttribute("lvo", lvo);
            model.addAttribute("uvo1", uvo1);
        } else if (naveremailobj != null) {
            naveremail = naveremailobj.toString();
            UserVo uvo1 = mapper.userview2(naveremail);
            int user_id = uvo1.getId();

            locationVo lvo = mapper.locationview2(user_id);

            model.addAttribute("lvo", lvo);
            model.addAttribute("uvo1", uvo1);
        }
        return "/users/userview";
    }

    @Override
    public String userup(HttpSession session, locationVo lvo) {
        String email = null;
        String naveremail = null;

        Object emailobj = session.getAttribute("useremail");
        Object naveremailobj = session.getAttribute("naveremail");

        if (emailobj != null) {
            email = emailobj.toString();
        } else if (naveremailobj != null) {
            naveremail = naveremailobj.toString();
        }

        String check = "";
        if (email != null) {
            locationVo lvo2 = mapper.getuserid2(email);
            lvo.setName(lvo2.getName());
            lvo.setUser_id(lvo2.getId());

            check = mapper.locheck(email);
        } else if (naveremail != null) {
            locationVo lvo2 = mapper.getuserid(naveremail);
            lvo.setUser_id(lvo2.getId());
            lvo.setName(lvo2.getName());
            check = mapper.locheck2(naveremail);
        }


        if (check == null) {
            if (email == null && naveremail != null) {
                email = naveremail;
                lvo.setEmail(naveremail);
            }

            mapper.addressup(lvo);
        } else {
            System.out.println("check:" + check);
            if (email == null && naveremail != null) {
                email = naveremail;
                lvo.setEmail(naveremail);
            }

            mapper.userup(lvo);
        }

        return "redirect:/users/userview";
    }


    @Override
    public String pwdchg(HttpSession session, HttpServletRequest request) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String email = session.getAttribute("useremail").toString();
        String currentpwd = request.getParameter("currentpwd").toString();
        String newpwd = request.getParameter("newpwd");

        String oldpwd = mapper.pwdcheck(email);

        if (encoder.matches(currentpwd, oldpwd)) {
            String encoderPwd = passwordEncoder.encode(newpwd);
            System.out.println(encoderPwd);

            mapper.pwdchg(email, encoderPwd);
            return "redirect:/users/userview";
        } else {
            return "redirect:/users/userview";
        }
    }

    @Override
    public String delete(HttpServletRequest request, HttpSession session) {

        int userid = Integer.parseInt(request.getParameter("userid"));

        System.out.println(userid);
        mapper.delete(userid);
        mapper.lodelete(userid);

        session.invalidate();

        return "redirect:/";
    }
}
