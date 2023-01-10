package three.auction.service;
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
	public UserVO findUserByuserNum(int userNum) {
		return this.userMapper.findUserByuserNum(userNum);
	}
}