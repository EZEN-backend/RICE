package kr.co.rice.controller;

import kr.co.rice.service.ProductListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class ProductListController {

    @Autowired
    @Qualifier("pls")
    private ProductListService service;
}
