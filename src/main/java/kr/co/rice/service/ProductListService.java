package kr.co.rice.service;

import org.json.simple.JSONObject;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public interface ProductListService {
	public String category_list(int category_id, int subcategory_id, Model model);

	public String product_views(int product_id);
	public String detail(int product_id, Model model);
}
