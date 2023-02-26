package kr.co.rice.service;

import org.springframework.ui.Model;

public interface CartWishService {
	
	String cart(Model model);
	String wish(String del_id,Model model);

}
