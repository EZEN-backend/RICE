package kr.co.rice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.rice.mapper.SearchMapper;

@Service
@Qualifier("ss")
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchMapper mapper;
}
