package kr.co.rice.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface CartWishService {
	
	String cart(Model model, HttpSession session);
	String wish(Model model, HttpSession session);
	String insertIntoCarts(String product_id,String size, String spicy, HttpSession session);
	String cartCount(HttpSession session);
	String cartDel(String id);
	String insertIntoWishlists(String product_id, HttpSession session);
	String wishlistDel(String del_id);
	String changeCartsOption(String cartId, int quantity,String size, String spicy);
}
