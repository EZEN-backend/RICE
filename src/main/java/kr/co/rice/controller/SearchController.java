package kr.co.rice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
//	@ResponseBody
//	@RequestMapping(value="/search/getItems2",method=RequestMethod.GET,produces = "application/json; charset=utf8")
//	public ArrayList<ProductVo> getItems(HttpServletRequest request ,Model model)
//	{
//		return service.getItems2(request,model);
//	}
}
