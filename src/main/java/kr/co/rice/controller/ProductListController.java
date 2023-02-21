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

@Controller
public class ProductListController {
	
	@Autowired
	@Qualifier("pls")
	private ProductListService service;
	
	@RequestMapping("/products/list")
	public String products_list(Model model) {
		return service.list(model);
	}

	@RequestMapping("/products/detail/{id}")
	public String products_detail(@PathVariable("id") int id, Model model) {
		return service.detail(model, id);
	}

}
