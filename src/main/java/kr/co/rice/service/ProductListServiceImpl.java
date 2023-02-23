package kr.co.rice.service;

import java.util.ArrayList;

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
		model.addAttribute("list", list);
		return "/products/list";
	}
}
