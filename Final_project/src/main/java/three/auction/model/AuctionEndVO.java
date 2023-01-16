package three.auction.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuctionEndVO {
	
	private int auctionEndNum;
	
	private int prodNum_fk;
	
	private String prodName;
	
	private String buyId;
	
	private String sellId;
	
	private Date endDate;
	
	private int endPrice;
	
	private int aucStatus; //물품배송전(0) 거래완료&평가전(1) 물품배송완료&구매자만평가완료(2) 물품배송완료&판매자만평가완료(3) 둘다 완료(4) 입찰자가없을때(5)
	
}
