package kr.co.rice.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.rice.mapper.ProductListMapper;
import kr.co.rice.vo.ProductVo;

@Service
@Qualifier("pls")
public class ProductListServiceImpl implements ProductListService{
	
	@Autowired
	private ProductListMapper mapper;

	@Override
	public String category_list(int category_id, int subcategory_id, Model model) {
		ArrayList<ProductVo> list = mapper.category_list(category_id, subcategory_id);
		
		model.addAttribute("category_id",category_id);
		model.addAttribute("subcategory_id",subcategory_id);
		model.addAttribute("list", list);
		return "/products/list";
	}
	
	@Override
	public ArrayList<ProductVo> getItems(HttpServletRequest request) {
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		int subcategory_id = Integer.parseInt(request.getParameter("subcategory_id"));
		
		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));
		
		ArrayList<ProductVo>list = mapper.getItems(category_id,subcategory_id,start,end);
		
		
		return list;
		
		
	}
}
