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
	
	private int aucStatus;
	
}
