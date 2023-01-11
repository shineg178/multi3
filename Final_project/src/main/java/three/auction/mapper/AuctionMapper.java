package three.auction.mapper;

import java.util.Date;
import java.util.List;

import three.auction.model.AuctionEndVO;
import three.auction.model.AuctionVO;
import three.product.model.ProductVO;
public interface AuctionMapper {
	
	int insertProduct(ProductVO pvo);
	
	int insertAuction(AuctionVO avo);
	
	int insertAuctionEnd(AuctionEndVO endVo);

	AuctionVO selectMaxAuctionByProdNum(int prodNum);
	
	List<ProductVO> findAllProductList();
	
	ProductVO findProductByProdNum(int prodNum);
	
}