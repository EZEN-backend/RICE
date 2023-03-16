package kr.co.rice.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.rice.vo.ProductImagesVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.rice.mapper.ProductListMapper;
import kr.co.rice.vo.ProductVo;

@Service
@Qualifier("pls")
public class ProductListServiceImpl implements ProductListService {

    @Autowired
    private ProductListMapper mapper;

    @Override
    public String category_list(int category_id, int subcategory_id, Model model) {
        ArrayList<ProductVo> list = mapper.category_list(category_id, subcategory_id);
        model.addAttribute("category_id", category_id);
        model.addAttribute("subcategory_id", subcategory_id);
        model.addAttribute("list", list);
        return "/products/list";
    }

    @Override
    public String product_views(int product_id) {
        mapper.product_views(product_id);
        return "redirect:/products/detail/" + product_id;
    }

    @Override
    public String detail(int product_id, Model model) {
        ProductVo pvo = mapper.detail(product_id);
        ArrayList<ProductVo> recommend_pvo = mapper.recommend_products();
        ArrayList<ProductImagesVo> imglist = mapper.getProductImage(product_id);
        model.addAttribute("recommend_pvo", recommend_pvo);
        model.addAttribute("imglist", imglist);
        model.addAttribute("pvo", pvo);
        return "/products/detail";
    }

    @Override
    public ArrayList<ProductVo> getItems(HttpServletRequest request) {
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        int subcategory_id = Integer.parseInt(request.getParameter("subcategory_id"));
        int start = Integer.parseInt(request.getParameter("start"));
        int end = Integer.parseInt(request.getParameter("end"));
        ArrayList<ProductVo> list = mapper.getItems(category_id, subcategory_id, start, end);
        return list;
    }

    
  //장바구니 페이지에서 주문결제 버튼 클릭시 주문결제창으로
  	@Override
  	public String orderPage(String cartId, String price, String totalPrice,String subTotalPrice,String deliveryFees, HttpSession session, Model model) {
  		
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
  		
  		//로그인 되어있는 경우
  		else {
  			String[] cartIds=cartId.split("-");
  		    String[] prices=price.split("-");
  				
  			//배송 도착 예정일 구하기
  			String deliveryDay=mapper.getDeliveryDay(user_id, cartIds[0]);
  				
  			//장바구니 테이블에서 저장된 데이터를 불러와서 cartlist에 담기
  			ArrayList<HashMap<String,String>> cartList=new ArrayList<HashMap<String,String>>();
  				
  			for(int i=0; i<cartIds.length; i++) {
  				HashMap<String,String> cartMap=mapper.getCartsByCartId(user_id, cartIds[i]);
  				//cartList에 해당 장바구니 상품의 가격을 저장하기
  				cartMap.put("price", prices[i]);
  				//cartMap을 cartList에 담기
  				cartList.add(cartMap);
  			}
  				
  			//cartList 와 totalPrice, deliveryDay 를 order.jsp 로 보내기
  			model.addAttribute("cartList", cartList);
  			model.addAttribute("totalPrice", totalPrice);
  			model.addAttribute("subTotalPrice", subTotalPrice);
  			model.addAttribute("deliveryFees", deliveryFees);
  			model.addAttribute("deliveryDay", deliveryDay);
  				
  			return "products/order";
  		}
  	}

  	//상품상세페이지에서 결제버튼 클릭시 주문결제 페이지로 연결
	@Override
	public String orderPageSecond(double price, HttpSession session, Model model) {
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
  		
  		//로그인 되어있는 경우
  		else {
  			
  			//가장 마지막에 update 된 장바구니 데이터값 가져오기
  			HashMap<String,Object> cartMap=mapper.getCartsRecently(user_id);
  			
  			//배송 도착 예정일 구하기
  			String deliveryDay=cartMap.get("deliveryDay").toString();
  			         
  			//상품 가격을 사이즈에 맞춰 조정하고, cartMap 에 담기
  			String size=cartMap.get("size").toString();
  			         	            
  			if(size.equals("S")) {
  				price=price*1;
  			} else if(size.equals("M")) {
  				price=price*1.2;
  			} else if(size.equals("L")) {
  				price=price*1.4;
  			}

			//5만원 이상 무료배송, 5만원 미만 배송비 5,000원 처리
			String deliveryFees=null; //배송비
			String subTotalPrice=null; //배송비 포함 전 가격
			String totalPrice=null; // 배송비 포함 후 가격
            //상품 가격에 세자리 단위 ',' 표시하기 위한 DecimalFormat
			DecimalFormat decFormat=new DecimalFormat("###,###");

			if(price >= 50000) {
				deliveryFees="무료배송";
				subTotalPrice= decFormat.format(price)+"원";
				totalPrice= decFormat.format(price)+"원";
			} else if(price < 50000) {
				deliveryFees="5,000원";
				subTotalPrice= decFormat.format(price)+"원";
				price += 5000; //상품가격에 배송비 포함시킴
				totalPrice= decFormat.format(price)+"원";
			}

  			//세자리 ',' 표시까지 마친 배송비 포함전 상품가격을 map 에 담기
  			cartMap.put("price", subTotalPrice);
  			//cartMap을 cartlist에 담기
  			ArrayList<HashMap<String,Object>> cartList=new ArrayList<HashMap<String,Object>>();
  			cartList.add(cartMap);	
  			  				
  			//cartList 와 totalPrice, deliveryDay 를 order.jsp 로 보내기
  			model.addAttribute("cartList", cartList);
  			model.addAttribute("subTotalPrice", subTotalPrice);
  			model.addAttribute("totalPrice", totalPrice);
  			model.addAttribute("deliveryFees", deliveryFees);
  			model.addAttribute("deliveryDay", deliveryDay);
  				
  			return "products/order";
  		}
	}
}
