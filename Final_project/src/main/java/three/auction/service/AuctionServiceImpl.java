package three.auction.service;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import three.auction.mapper.AuctionMapper;
import three.auction.model.AuctionEndVO;
import three.auction.model.AuctionVO;
import three.product.mapper.ProductMapper;
import three.product.model.ProductVO;
import three.user.mapper.UserMapper;
import three.user.model.UserVO;
@Service("auctionServiceImpl")
public class AuctionServiceImpl implements AuctionService {
	
	@Autowired
	private AuctionMapper auctionMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int insertProduct(ProductVO pvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertAuction(AuctionVO avo) {
		return this.auctionMapper.insertAuction(avo);
	}
	
	@Override
	public int insertAuctionEnd(AuctionEndVO endVo) {
		return this.auctionMapper.insertAuctionEnd(endVo);
	}
	
	@Override
	public ProductVO selectProductByProdNum(int prodNum) {
		
		return this.productMapper.selectProductByProdNum(prodNum);
	}
	@Override
	public AuctionVO selectMaxAuctionByProdNum(int prodNum) {
		
		return this.auctionMapper.selectMaxAuctionByProdNum(prodNum);
	}
	
	@Override
	public UserVO findUserByUserId(String userId) {
		return this.userMapper.findUserByUserId(userId);
	}
	
	@Override
	public List<ProductVO> findProductbiding() {
		return this.auctionMapper.findProductbiding();
	}
	
	@Override
	public ProductVO findProductByProdNum(int prodNum) {
		return this.auctionMapper.findProductByProdNum(prodNum);
	}
	
	@Override
	public int findAuctionEnd(AuctionEndVO endVO) {
		int n=0;
		if(this.auctionMapper.findAuctionEnd(endVO)==null) {
			n=1;
		}
		return n; 
	}
	
	@Override
	public int chageProductStatus(int prodNum) {
		return this.auctionMapper.chageProductStatus(prodNum);
	}
	
	@Override
	public int minusPointByAuction(AuctionVO vo) {
		return this.auctionMapper.minusPointByAuction(vo);
	}
	
	@Override
	public int plusPointByAuction(AuctionVO vo) {
		return this.auctionMapper.plusPointByAcution(vo);
	}
	
}
