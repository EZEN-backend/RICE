package kr.co.rice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rice.service.SearchService;
import kr.co.rice.vo.ProductVo;

@Controller
public class SearchController {
	
	@Autowired
	@Qualifier("ss")
	private SearchService service;
	
	@RequestMapping("/search/list")
	public String list(HttpServletRequest request,Model model)
	{
		return service.list(request, model);
	}
}
