package kr.co.rice.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.rice.vo.ProductVo;

public interface ProductListService {
	public String category_list(int category_id, int subcategory_id, Model model);
	public ArrayList<ProductVo> getItems(HttpServletRequest request, Model model);
}
