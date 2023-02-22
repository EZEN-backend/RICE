package kr.co.rice.mapper;

import java.util.ArrayList;

import kr.co.rice.vo.ProductVo;

public interface ProductListMapper {
	public ArrayList<ProductVo> category_list(int category_id, int subcategory_id);
}
