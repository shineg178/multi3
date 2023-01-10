package three.product.service;

import java.util.List;

import three.product.model.ProductVO;

public interface ProductService {
	
	//상품 등록
	int addProduct(ProductVO vo);
	
	//모든 물품 정보 가져오기
	List<ProductVO> allProduct();
	
	//카테고리 번호로 물품 가져오기
	List<ProductVO> cateProduct(int cno);
}
