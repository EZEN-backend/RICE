package kr.co.rice.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rice.service.AdminService;
import kr.co.rice.vo.ProductVo;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class AdminController {
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	//admin 메인 페이지
	@RequestMapping("/admin")
	public String main()
	{
		return "/admin/main";
	}
	//admin 상품등록 페이지
	@RequestMapping("/admin/register")
	public String register()
	{
		return "/admin/register";
	}
	
	//상품등록 form 에서 상품입력 후 상품정보를 DB에 저장하기
	@RequestMapping("/admin/registerInput")
	public String registerInput(MultipartHttpServletRequest multi) throws IOException {

		return service.registerProduct(multi);
	}
}
