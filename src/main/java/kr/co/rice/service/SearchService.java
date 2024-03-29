package kr.co.rice.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import kr.co.rice.vo.ProductVo;

public interface SearchService {
	
	public String list(HttpServletRequest request,Model model);
	public ArrayList<ProductVo> getItems2(HttpServletRequest request, Model model);
	public ArrayList<HashMap<String,Object>>product();

}