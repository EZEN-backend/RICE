package kr.co.rice.service;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.rice.mapper.CartWishMapper;
import kr.co.rice.vo.CartVo;
import kr.co.rice.vo.WishlistVo;

@Service
public class CartWishServiceImpl implements CartWishService {
	
	private final CartWishMapper cartWishMapper;
	
	@Autowired
	public CartWishServiceImpl(CartWishMapper cartWishMapper) {
		this.cartWishMapper=cartWishMapper;
	}

	@Override
	public String cart(Model model, HttpSession session) {
		//로그인한 고객이 일반 로그인인지 네이버 로그인인지 구별해서, user_id 에 고객의 email을 저장함
		String user_id=null;
		
	    Enumeration<String> attrNames = session.getAttributeNames();                
	      
	    while(attrNames.hasMoreElements()){
	    	
	    	String attrName=attrNames.nextElement();
	    	if(attrName.equals("useremail")) {
	    		user_id=session.getAttribute("useremail").toString();
	    	}
	    	else if(attrName.equals("naveremail")) {
	    		user_id=session.getAttribute("naveremail").toString();
	    	}
	    }
	    
		//로그인 하지 않았다면 로그인 페이지로
		if(user_id==null) {
			return "redirect: /users/signin";
		}
		//로그인 되어 있다면
		else {
			ArrayList<HashMap<String,Object>> cartList=cartWishMapper.getCarts(user_id);
		    
		    //size별 가격을 계산해 subPrice 값을 저장
		    for(HashMap<String,Object> map : cartList) {
		    	String subPrice="";
		    	int price=Integer.parseInt(map.get("price").toString());
		    	int quantity=Integer.parseInt(map.get("quantity").toString());
		    	String size=map.get("size").toString();
		    	
		    	if(size.equals("S")) subPrice=String.valueOf(price*quantity*1);
		    	else if(size.equals("M")) subPrice=String.valueOf(price*quantity*1.2);
		    	else if(size.equals("L")) subPrice=String.valueOf(price*quantity*1.4);
		    	
		    	map.put("subPrice", subPrice);
		   }
		    
		    //json 형태로 cartList를 변환-장바구니 화면의 옵션 태그들에게 값을 부여하기 위해
		    JSONArray cartList1=new JSONArray(cartList);
				
		    String count=cartWishMapper.getCount(user_id);
		
		    model.addAttribute("cartList", cartList);
		    model.addAttribute("cartList1", cartList1);
		    model.addAttribute("count", count);
		
		    return "cartwish/cart";
		}
	}
  
	//위시리스트 페이지 열기
	@Override
	public String wish(Model model, HttpSession session) {
		//로그인한 고객이 일반 로그인인지 네이버 로그인인지 구별해서, user_id 에 고객의 email을 저장함
		String user_id=null;
				
	    Enumeration<String> attrNames = session.getAttributeNames();                
			      
		while(attrNames.hasMoreElements()){
			    	
		    String attrName=attrNames.nextElement();
		    if(attrName.equals("useremail")) {
			    user_id=session.getAttribute("useremail").toString();
		    }
		    else if(attrName.equals("naveremail")) {
			    user_id=session.getAttribute("naveremail").toString();
		    }
	    }						
		//로그인 하지 않았다면 로그인 페이지로
		if(user_id==null) {
			return "redirect: /users/signin";
		}
		
		else {
			//위시리스트 화면 출력
			ArrayList<HashMap<String,String>> wishList=cartWishMapper.getWishLists(user_id);

		    model.addAttribute("wishList",wishList);


		    return "cartwish/wish";
		}
	}

	//장바구니 테이블에 상품 저장하기
	@Override
	public String insertIntoCarts(String product_id,String size, String spicy, HttpSession session) {
		//로그인한 고객이 일반 로그인인지 네이버 로그인인지 구별해서, user_id 에 고객의 email을 저장함
		String user_id=null;
		
	    Enumeration<String> attrNames = session.getAttributeNames();                
			      
		while(attrNames.hasMoreElements()){
			    	
		    String attrName=attrNames.nextElement();
		    if(attrName.equals("useremail")) {
			    user_id=session.getAttribute("useremail").toString();
		    }
		    else if(attrName.equals("naveremail")) {
			    user_id=session.getAttribute("naveremail").toString();
		    }
	    }		
		
		//로그인 하지 않았다면 로그인 페이지로
		if(user_id==null) {
			return "a";
		}
				
		else {
     	    //현재 장바구니에 들어있는 상품인지 먼저 확인
		    HashMap<String,Object> cartNum=cartWishMapper.checkCarts(user_id,product_id,size,spicy);
		    int num=Integer.parseInt(cartNum.get("num").toString());
		 
		    //현재 담겨있는 기존 상품이 없다면 장바구니 table에 새로 입력
		    if(num==0) {
		        CartVo cartVo=new CartVo();
		        cartVo.setProduct_id(product_id);
		        cartVo.setUser_id(user_id);
		        cartVo.setSize(size);
		        cartVo.setSpicy(spicy);
		      
		        cartWishMapper.insertIntoCarts(cartVo);
		        
		        // 현재 장바구니에 담겨있는 상품 수량 가져와 화면쪽에 뿌려줌
			    String count=cartWishMapper.getCount(user_id);
		        return count;
		    }
		    //장바구니 table에 상품이 이미 담겨있다면, 최대구매수량인 5개 초과인지 확인
		    else {
		    	// 상품 수량 quantity
		    	int quantity=Integer.parseInt(cartNum.get("quantity").toString());
		    	// 최대 구매수량 초과의 경우
		    	if(quantity>=5) {
		    	   	return "0";
		        }
		        // 최대 구매수량보다 적게 있는 경우 , 구매수량 +1 
		        else {
		    	    String id=cartNum.get("id").toString();
			        cartWishMapper.plusQuantity(id);
			        // 현재 장바구니에 담겨있는 상품 수량 가져와 화면쪽에 뿌려줌
			        String count=cartWishMapper.getCount(user_id);
			        return count;
		        }
			
		    }
		 }
	}

	//장바구니에 담겨있는 수량 체크해서 , 화면 우측 상단 장바구니 카트에 수량 넣어주기 
	@Override
	public String cartCount(HttpSession session) {
		//로그인한 고객이 일반 로그인인지 네이버 로그인인지 구별해서, user_id 에 고객의 email을 저장함
        String user_id=null;
		
	    Enumeration<String> attrNames = session.getAttributeNames();                
			      
		while(attrNames.hasMoreElements()){
			    	
		    String attrName=attrNames.nextElement();
		    if(attrName.equals("useremail")) {
			    user_id=session.getAttribute("useremail").toString();
		    }
		    else if(attrName.equals("naveremail")) {
			    user_id=session.getAttribute("naveremail").toString();
		    }
	    }	
		
		//로그인 하지 않았다면 장바구니 수량은 0
		if(user_id==null) {
			return "0";
        }
		else {
			// 현재 장바구니에 담겨있는 상품 수량 가져옴
	        String count=cartWishMapper.getCount(user_id);
		    // 상품수량을 ajax 로 상품 상세페이지로 보냄
		    return count ;
		}
	}
    
	//장바구니에서 상품 삭제시 carts 테이블에서도 삭제
	@Override
	public String cartDel(String id) {
		
		String cartIds[]=id.split(",");
		
		for(String cartId : cartIds ) {
			cartWishMapper.cartDel(cartId);
		}
		
		
		return "redirect: /cart";
	}
    
	// 상품 상세페이지에서 위시리스트 클릭시 wishlists 테이블에 상품 담기
	@Override
	public String insertIntoWishlists(String product_id,HttpSession session) {
		//로그인한 고객이 일반 로그인인지 네이버 로그인인지 구별해서, user_id 에 고객의 email을 저장함
        String user_id=null;
		
	    Enumeration<String> attrNames = session.getAttributeNames();                
			      
		while(attrNames.hasMoreElements()){
			    	
		    String attrName=attrNames.nextElement();
		    if(attrName.equals("useremail")) {
			    user_id=session.getAttribute("useremail").toString();
		    }
		    else if(attrName.equals("naveremail")) {
			    user_id=session.getAttribute("naveremail").toString();
		    }
	    }	
		
		//로그인 하지 않았다면 로그인 페이지로
		if(user_id==null) {
			return "a";
		}
						
		else {
			System.out.println(product_id+user_id);
			//현재 위시리스트에 있는 상품인지 먼저 확인
		    HashMap<String,Object> wishNum=cartWishMapper.checkWishlists(product_id,user_id);
		    
		    int num=Integer.parseInt(wishNum.get("num").toString());
		        System.out.println("넘어온 숫자"+num);    		    				
		    //현재 담겨있는 기존 상품이 없다면 위시리스트에 새로 입력
		    if(num==0) {
			
		        WishlistVo wishlistVo=new WishlistVo();
		        wishlistVo.setProduct_id(product_id);
		        wishlistVo.setUser_id(user_id);
			    cartWishMapper.insertIntoWishlists(wishlistVo);
			
			    return "1";
		    }
				// 위시리스트에 이미 상품이 담겨있음
		    else {
			    // 위시리스트 상품  삭제
		    	String wishId=wishNum.get("id").toString();
		    	cartWishMapper.wishlistDel(wishId);
			    return "0";
			}
		}
	}
    
	//위시리스트 삭제하기
	@Override
	public String wishlistDel(String del_id) {

        String[] wishIds=del_id.split(",");
        //wishlist 테이블의 상품을 삭제
        for(String wishId : wishIds) {
        	
        	cartWishMapper.wishlistDel(wishId);
        }
        
		return "redirect: /wish";
	}
    
	// 장바구니의 상품 수량 변경
	@Override
	public String changeCartsOption(String cartId, int quantity, String size, String spicy) {

        cartWishMapper.changeCartsOption(cartId,quantity,size,spicy);
		return "success";
	}


}
