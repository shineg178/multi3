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
	
	private int buyUser_fk;
	
	private int sellUser_fk;
	
	private Date endDate;
	
	private int endPrice;
	
	private int aucStatus;
	
}
