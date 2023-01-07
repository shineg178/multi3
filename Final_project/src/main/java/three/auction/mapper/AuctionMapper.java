package three.auction.mapper;

import three.auction.model.AuctionVO;
import three.product.model.ProductVO;

public interface AuctionMapper {
	
	int insertProduct(ProductVO pvo);
	
	int insertAuction(AuctionVO avo);
	
	AuctionVO selectAuctionByProdNum(int prodNum);
	
	
}
