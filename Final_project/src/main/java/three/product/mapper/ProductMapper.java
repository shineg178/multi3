package three.product.mapper;

import three.product.model.ProductVO;

public interface ProductMapper {
	
	ProductVO selectProductByProdNum(int prodNum);
	
}
