package kr.co.rice.controller;

import kr.co.rice.service.ProductListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductListController {

    @Autowired
    @Qualifier("pls")
    private ProductListService service;

    @RequestMapping("/products/list")
    public String products_list() {

        return "/products/list";
    }
}
