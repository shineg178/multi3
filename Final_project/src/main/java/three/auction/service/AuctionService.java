package three.auction.service;

import three.auction.model.AuctionEndVO;
import three.auction.model.AuctionVO;
import three.product.model.ProductVO;
import three.user.model.UserVO;

public interface AuctionService {
	
	int insertProduct(ProductVO pvo);
	
	int insertAuction(AuctionVO avo);
	
	int insertAuctionEnd(AuctionEndVO endVo);
	
	ProductVO selectProductByProdNum(int prodNum);
	
	AuctionVO selectMaxAuctionByProdNum(int prodNum);
	
	UserVO findUserByuserNum(int userNum);
	
}
