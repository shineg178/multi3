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
	
	List<ProductVO> findProductbiding();
	
	ProductVO findProductByProdNum(int prodNum);
	
	int findAuctionEnd(AuctionEndVO endVO);
	
	int chageProductStatus(int prodNum);
	
	int minusPointByAuction(AuctionVO vo);
	
	int plusPointByAuction(AuctionVO vo);
	
	
	
}