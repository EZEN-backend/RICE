package kr.co.rice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.rice.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	@Qualifier("ss")
	private SearchService service;
}
