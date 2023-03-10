package kr.co.rice.service;

import java.util.ArrayList;

import kr.co.rice.vo.ProductImagesVo;
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

	@Override
	public String product_views(int product_id) {
		mapper.product_views(product_id);
		return "redirect:/products/detail/"+product_id;
	}

	@Override
	public String detail(int product_id, Model model) {
		ProductVo pvo = mapper.detail(product_id);
		ArrayList<ProductVo> recommend_pvo = mapper.recommend_products();
		ArrayList<ProductImagesVo> imglist = mapper.getProductImage(product_id);
		model.addAttribute("recommend_pvo", recommend_pvo);
		model.addAttribute("imglist", imglist);
		model.addAttribute("pvo", pvo);
		return "/products/detail";
	}

}
