package three.auction.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import three.user.model.UserVO;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuctionVO {
	
	private int aucNum;
	private int prodNum_fk;
	private String userId;
	private int	aucPrice;
	private Date aucDate;
}
