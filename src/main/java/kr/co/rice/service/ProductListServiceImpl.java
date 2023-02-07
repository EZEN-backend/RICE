package kr.co.rice.service;

import kr.co.rice.mapper.ProductListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("pls")
public class ProductListServiceImpl implements ProductListService{
    @Autowired
    private ProductListMapper mapper;
}
