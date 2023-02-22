package kr.co.rice.service;

import org.springframework.ui.Model;

public interface ProductListService {
	public String category_list(int category_id, int subcategory_id, Model model);
}
