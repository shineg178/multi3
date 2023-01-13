package three.product.mapper;

import java.util.List;

import three.product.model.ProductVO;

public interface ProductMapper {
	
	ProductVO selectProductByProdNum(int prodNum);
	
	//상품 등록
	int addProduct(ProductVO vo);
	
	//모든 물품 정보 가져오기
	List<ProductVO> allProduct();
	
	//카테고리 번호로 물품 가져오기
	List<ProductVO> cateProduct(int cno);
	
	//검색어로 물품 찾기
	List<ProductVO> prodSearch(String searchName);
	
}
