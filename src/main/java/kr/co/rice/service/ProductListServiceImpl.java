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
	public String list(Model model) {
		ArrayList<ProductVo> list = mapper.list();
		model.addAttribute("list", list);
		return "/products/list";
	}
}
