package kr.co.rice.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.rice.mapper.SearchMapper;
import kr.co.rice.vo.ProductVo;

@Service
@Qualifier("ss")
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchMapper mapper;

	@Override
	public String list(HttpServletRequest request, Model model) {
		
		String search = request.getParameter("search");
		
		if(request.getParameter("search")==null)
			search = request.getParameter("search");

		ArrayList<ProductVo> list = mapper.list(search);
		model.addAttribute("search",search);
		model.addAttribute("list",list);
		
		return "/products/list";
	}
	
	@Override
	public ArrayList<ProductVo> getItems2(HttpServletRequest request,Model model) {
		String search = request.getParameter("search");
		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));
		
		ArrayList<ProductVo>list = mapper.getItems(search,start,end);
		
		
		return list;
	}

	@Override
	public ArrayList<HashMap<String,Object>> product() {
		
	    ArrayList<HashMap<String,Object>> topview = mapper.product();
	    
	    return topview;
	}
	
}
