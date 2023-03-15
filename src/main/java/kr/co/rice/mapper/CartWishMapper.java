package kr.co.rice.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.rice.vo.CartVo;
import kr.co.rice.vo.WishlistVo;

public interface CartWishMapper {
	//장바구니 상품들 가져오기
	ArrayList<HashMap<String,Object>> getCarts(String user_id);
	
	//위시리스트 상품 가져오기
    ArrayList<HashMap<String,String>> getWishLists(String user_id);
    
	//장바구니 테이블에 잇는 상품 수량 가져옴
	String getCount(String user_id);
	
	//장바구니에 상품을 담기
	void insertIntoCarts(CartVo cartVo);
	
	//위시리스트에 상품을 담기
    void insertIntoWishlists(WishlistVo wishlistVo);
    
	//현재 장바구니에 이미 해당상품이 들어있는지 확인
	HashMap<String,Object> checkCarts(String user_id,String product_id,String size,String spicy);
	
	//현재 위시리스트에 이미 해당상품이 들어있는지 확인
	HashMap<String,Object> checkWishlists(String product_id,String user_id);
	
	//기존에 장바구니에 들어있던 상품의 경우 수량 증가
	void plusQuantity(String id);
	
	//장바구니 상품 삭제
    void cartDel(String cartId);
    
   //위시리스트 상품 삭제
    void wishlistDel(String wishId);
    	
    //장바구니의 상품 수량 변경하기
    void changeCartsOption(String cartId, int quantity, String size, String spicy);
}
