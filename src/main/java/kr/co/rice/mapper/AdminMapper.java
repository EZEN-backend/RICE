package kr.co.rice.mapper;

import kr.co.rice.vo.ProductVo;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
	//products 테이블에 상품 정보 저장후 , 생성된 id 값을 가져오기
	int insertProduct(ProductVo productVo);

	//products_images 테이블에 product_id 와 image_url 을 저장하기
	void insertImgUrl(int product_id, String image_url);

}
