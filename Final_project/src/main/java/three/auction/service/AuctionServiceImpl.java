package three.auction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.auction.mapper.AuctionMapper;
import three.auction.model.AuctionVO;
import three.product.model.ProductVO;
import three.user.mapper.UserMapper;
import three.user.model.UserVO;

@Service("auctionServiceImpl")
public class AuctionServiceImpl implements AuctionService {
	
	@Autowired
	private AuctionMapper auctionMapper;
	

	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int insertProduct(ProductVO pvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAuction(ProductVO pvo, AuctionVO avo) {
		return 0;
	}


	@Override
	public AuctionVO selectAuctionByProdNum(int prodNum) {
		
		return this.auctionMapper.selectAuctionByProdNum(prodNum);
	}
	
	@Override
	public UserVO findUserByuserNum(int userNum) {
		return this.userMapper.findUserByuserNum(userNum);
	}

	@Override
	public ProductVO selectProductByProdNum(int prodNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
