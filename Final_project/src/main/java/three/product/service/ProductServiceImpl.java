package three.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import three.product.mapper.ProductMapper;
import three.product.model.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductMapper productMapper;
	
	@Override
	public int addProduct(ProductVO vo) {
		return productMapper.addProduct(vo);
	}

	@Override
	public List<ProductVO> allProduct() {
		return productMapper.allProduct();
	}

	@Override
	public List<ProductVO> cateProduct(int cno) {
		return productMapper.cateProduct(cno);
	}

	@Override
	public List<ProductVO> prodSearch(String searchName) {
		return productMapper.prodSearch(searchName);
	}

}
