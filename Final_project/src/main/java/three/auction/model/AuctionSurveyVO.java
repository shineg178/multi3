package three.auction.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuctionSurveyVO {
	
	private int aucEndNum;
	
	private String doUserId;
	
	private String takeUserId;
	
	private int score;
	
	private String review;
	
}
