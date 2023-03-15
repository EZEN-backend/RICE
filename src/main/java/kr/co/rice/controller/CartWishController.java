package kr.co.rice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.rice.service.CartWishService;
import kr.co.rice.service.CartWishServiceImpl;

@Controller
public class CartWishController {
	
	private final CartWishService cartWishService;
	
	@Autowired
	public CartWishController(CartWishServiceImpl cartWishService) {

		this.cartWishService=cartWishService;
	}
	
	//장바구니 페이지 보기
	@RequestMapping("/cart")
	public String cart(Model model, HttpSession session) {

		return cartWishService.cart(model, session);
	}
	
	//상품 상세페이지에서 장바구니 담기 클릭시 실행되는 함수
	@ResponseBody
	@RequestMapping(value="/cartBtn", produces="text/plain; charset=utf-8")
	public String cartBtn(String product_id, String size, String spicy, HttpSession session) {
		
		return cartWishService.insertIntoCarts(product_id,size,spicy,session);
	}
	
	//상품 상세페이지에서 위시리스트 버튼 클릭시 wishlists DB에 데이터 저장
	@ResponseBody
	@RequestMapping(value="/wishBtn/{product_id}", produces="text/plain; charset=utf-8")
	public String wishBtn(@PathVariable String product_id, HttpSession session) {
		
		return cartWishService.insertIntoWishlists(product_id,session);
	}
	
	//위시리스트 페이지 출력
	@RequestMapping("/wish")
	public String wish(Model model, HttpSession session) {

		return cartWishService.wish(model,session);
	}
	
	//위시리스트 삭제
	@RequestMapping("/wish/{del_id}")
	public String wish(@PathVariable String del_id) {
		
			return cartWishService.wishlistDel(del_id);
	}
	
	//장바구니에 담겨있는 수량 체크해서 , 화면 우측 상단 장바구니 카트에 수량 넣어주기
	@ResponseBody
	@RequestMapping(value="/cartCount", produces="text/plain; charset=utf-8")
	public String cartCount(HttpSession session) {
		
		return cartWishService.cartCount(session);
	}
	
	//장바구니 상품 삭제시 
	@RequestMapping("/cartDel")
	public String cartDel(String id) {
		
		return cartWishService.cartDel(id);
	}
	
	//장바구니 페이지에서 장바구니 상품 옵션 변경시
	@ResponseBody
	@RequestMapping(value="/cartOption", produces="text/plain; charset=utf-8")
	public String cartQuantity(String cartId, int quantity, String size, String spicy) {
		
		return cartWishService.changeCartsOption(cartId, quantity, size, spicy);
	}


}
