package kr.co.rice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rice.service.CartWishService;
import kr.co.rice.service.CartWishServiceImpl;

@Controller
public class CartWishController {
	
	private final CartWishService cartWishService;
	
	@Autowired
	public CartWishController(CartWishServiceImpl cartWishService) {

		this.cartWishService=cartWishService;
	}
	
	@RequestMapping("/cart")
	public String cart(Model model) {

		return cartWishService.cart(model);
	}
	@RequestMapping("/wish")
	public String wish(String del_id, Model model) {

		return cartWishService.wish(del_id,model);
	}
	@RequestMapping("/wish/{del_id}/")
	public String wish_del(@PathVariable String del_id, Model model) {

		return cartWishService.wish(del_id,model);
	}



}
