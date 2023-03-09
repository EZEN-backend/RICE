package kr.co.rice.utils;
 
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.rice.mapper.UserMapper;

@Controller
public class NaverLoginController {
	
	@NonNull
	private NaverLoginService service;
	
	@NonNull
	private NaverCustomUserDetailService cusd;
	
	@NonNull
	private NaverLogin naverLogin;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLogin(NaverLogin naverLogin) {
		this.naverLogin = naverLogin;
	}
	@Autowired
	private UserMapper mapper;
	
	@RequestMapping(value = "/users/signin", method = { RequestMethod.GET, RequestMethod.POST })
	public String signin(Model model, HttpSession session) {

		String naverAuthUrl = naverLogin.getAuthorizationUrl(session);

		System.out.println("네이버:" + naverAuthUrl);

		model.addAttribute("url", naverAuthUrl);
 
		return "users/signin";
	}

	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request) throws IOException, ParseException {

		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLogin.getAccessToken(session, code, state);
 
		apiResult = naverLogin.getUserProfile(oauthToken); 
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		JSONObject response_obj = (JSONObject)jsonObj.get("response");

		String nickname = (String)response_obj.get("nickname");
		String naveremail = (String)response_obj.get("email");
		System.out.println(nickname);
		

		session.setAttribute("sessionId", nickname); 
		session.setAttribute("naveremail", naveremail);
		
		model.addAttribute("result", apiResult);
	    
		int count = mapper.Naver_Id_Check(naveremail);
		
		System.out.println(count);
	    
		if(count==1) {
			return "/main";
		}
		else {
			return "redirect:/users/agreement";
		}
		
	}
	@RequestMapping(value = "/signout", method = { RequestMethod.GET, RequestMethod.POST })
	public String signout(HttpSession session)throws IOException {
		
			session.invalidate();
 
			return "redirect:/";
		}
	
	@RequestMapping(value = "/users/signout", method = { RequestMethod.GET, RequestMethod.POST })
	public String signout2(HttpSession session)throws IOException {
		
			session.invalidate();

			return "redirect:/";
		}
	
}