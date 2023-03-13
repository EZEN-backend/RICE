package kr.co.rice.mapper;

import java.util.ArrayList;

import kr.co.rice.vo.ProductImagesVo;
import kr.co.rice.vo.ProductVo;

public interface ProductListMapper {
	public ArrayList<ProductVo> category_list(int category_id, int subcategory_id);
	public void product_views(int product_id);
	public ProductVo detail(int product_id);
	public ArrayList<ProductImagesVo> getProductImage(int product_id);
	public ArrayList<ProductVo> recommend_products();
	public ArrayList<ProductVo> getItems(int category_id,int subcategory_id,int start, int end);
}
