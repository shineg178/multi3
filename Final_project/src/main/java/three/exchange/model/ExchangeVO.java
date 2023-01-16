package three.exchange.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExchangeVO {
	
	private int exchangeNum;
	private String bankName;
	private String bankAccountNum;
	private String userName;
	private String userEmail;
	private String userId;
	private int exchangePoint;
	private Date exchangeTime;
	private int exchangeStatus;
}
