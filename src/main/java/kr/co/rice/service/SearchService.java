package kr.co.rice.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.ui.Model;

import kr.co.rice.vo.ProductVo;

public interface SearchService {
	
	public String list(HttpServletRequest request,Model model);
	public ArrayList<ProductVo> getItems2(HttpServletRequest request, Model model);
	public ArrayList<HashMap<String,Object>>product();

}