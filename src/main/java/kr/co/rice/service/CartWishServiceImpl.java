package kr.co.rice.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class CartWishServiceImpl implements CartWishService {

	@Override
	public String cart(Model model) {
		String[] pCode= {"p0101001","p0101002","p0101003","p0101004"};
		int[] price= {9000,8000,7500,8500};
		int[] amount= {1,2,3,4};
		String[] pTitle= {"한남북엇국","북창동 순두부찌개","쇠고기 미역국","시골 청국장 찌개"};
		String[] deliveryDay= {"02/27(월)","02/27(월)","02/28(화)","02/28(화)"};
		String[] pImg={"cartView1.png","cartView2.png","cartView3.png","cartView4.png"};
		
		ArrayList<HashMap> cartList=new ArrayList<HashMap>();
		
		for(int i=0;i<4;i++) {
			HashMap<String,Object> cartMap=new HashMap<String,Object>();
			
			cartMap.put("pCode", pCode[i]);
			cartMap.put("price", price[i]);
			cartMap.put("amount", amount[i]);
			cartMap.put("pTitle", pTitle[i]);
			cartMap.put("deliveryDay", deliveryDay[i]);
			cartMap.put("pImg", pImg[i]);
			
			cartList.add(cartMap);
		}
		
		model.addAttribute("cartList", cartList);
		
		return "cartwish/cart";
	}
	


}
