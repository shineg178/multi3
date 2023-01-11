package three.auction.service;

import java.util.Date;
import java.util.List;

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
	
	UserVO findUserByUserId(String userId);
	
	List<ProductVO> findAllProductList();
	
	ProductVO findProductByProdNum(int prodNum);
	
}