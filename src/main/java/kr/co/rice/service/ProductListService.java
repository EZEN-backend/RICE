package kr.co.rice.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.rice.vo.ProductVo;

public interface ProductListService {
	public String category_list(int category_id, int subcategory_id, Model model);
	public String product_views(int product_id);
	public String detail(int product_id, Model model, HttpSession session);
	public ArrayList<ProductVo> getItems(HttpServletRequest request);
	// 주문 확인 화면 _장바구니 페이지에서 연결
	public String orderPage(String cartId, String price, String totalPrice, HttpSession session, Model model);
	// 주문 확인 화면_상품상세페이지에서 연결 
    public String orderPageSecond(double price, HttpSession session, Model model);
}
