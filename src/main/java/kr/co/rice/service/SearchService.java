package kr.co.rice.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import kr.co.rice.vo.ProductVo;

public interface SearchService {
	
	public String list(HttpServletRequest request,Model model);
//	public ArrayList<ProductVo> getItems(HttpServletRequest request, Model model);

}