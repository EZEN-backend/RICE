package kr.co.rice.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.rice.mapper.SearchMapper;
import kr.co.rice.vo.ProductVo;

@Service
@Qualifier("ss")
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchMapper mapper;

//	@Override
//	public String search_list(HttpServletRequest request, Model model) {
//		String search = request.getParameter("search");
//		
//		model.addAttribute("search",mapper.search_list(search));
//		return "/search/search_list";
//	}
}
