package kr.co.rice.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import kr.co.rice.vo.ProductVo;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface AdminService {
	String registerProduct(MultipartHttpServletRequest multi) throws IOException;
	
}
