package kr.co.rice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rice.service.ProductListService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductListController {
	
	@Autowired
	@Qualifier("pls")
	private ProductListService service;

	@RequestMapping("/products/{category}/{subcategory}")
	public String category_list(@PathVariable("category")int category_id, @PathVariable("subcategory") int subcategory_id, Model model) {
		return service.category_list(category_id, subcategory_id, model);
	}
}
