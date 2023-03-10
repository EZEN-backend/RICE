package kr.co.rice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.co.rice.service.ProductListService;
import kr.co.rice.vo.ProductVo;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProductListController {

    @Autowired
    @Qualifier("pls")
    private ProductListService service;

    @RequestMapping("/products/{category}/{subcategory}")
    public String category_list(@PathVariable("category") int category_id, @PathVariable("subcategory") int subcategory_id, Model model) {
        return service.category_list(category_id, subcategory_id, model);
    }

    @GetMapping("/products/views/{product_id}")
    public String product_views(@PathVariable("product_id") int product_id) {
        return service.product_views(product_id);
    }

    @GetMapping("/products/detail/{product_id}")
    public String product_detail(@PathVariable("product_id") int product_id, Model model) {
        return service.detail(product_id, model);
    }

    @ResponseBody
    @RequestMapping(value = "/products/getItems", method = RequestMethod.GET, produces = "application/json; charset=utf8")
    public ArrayList<ProductVo> getItems(HttpServletRequest request) {
        return service.getItems(request);
    }
}
