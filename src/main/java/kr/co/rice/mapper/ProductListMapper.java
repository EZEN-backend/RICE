package kr.co.rice.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.rice.vo.ProductImagesVo;
import kr.co.rice.vo.ProductVo;
import kr.co.rice.vo.locationVo;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductListMapper {

    public ArrayList<ProductVo> category_list(int category_id, int subcategory_id);

    public void product_views(int product_id);

    public ProductVo detail(String user_id, int product_id);

    public ArrayList<ProductImagesVo> getProductImage(int product_id);

    public ArrayList<ProductVo> recommend_products();

    public ArrayList<ProductVo> getItems(int category_id, int subcategory_id, int start, int end);

    //장바구니 테이블에서 cartId에 해당하는 데이터 가져오기
    public HashMap<String,Object> getCartsByCartId(String user_id, String cartId);
    //배송예정일 가져오기
    public String getDeliveryDay(String user_id, String cartId);
    //장바구니 테이블에서 가장 마지막에 업데이트된 데이터 가져오기
    public HashMap<String,Object> getCartsRecently(String user_id);

    public locationVo loview(String user_id);

    public void locationup(locationVo lvo);

}
