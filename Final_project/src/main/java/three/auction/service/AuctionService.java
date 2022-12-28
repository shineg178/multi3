package three.auction.service;

import three.auction.model.AuctionVO;
import three.product.model.ProductVO;
import three.user.model.UserVO;

public interface AuctionService {
	
	int insertProduct(ProductVO pvo);
	
	int insertAuction(ProductVO pvo, AuctionVO avo);
	
	ProductVO selectProductByProdNum(int prodNum);
	
	AuctionVO selectAuctionByProdNum(int prodNum);
	
	UserVO findUserByuserNum(int userNum);
	
}
