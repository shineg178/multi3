package three.auction.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import three.user.model.UserVO;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuctionAlertVO {
	
	private int userNum_fk;
	private int prodNum_fk;
	private int reason;
	
}
