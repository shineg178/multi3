package three.donation.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DonateVO {
	//기부번호
	private int donNum;
	
	//기부한 회원 아이디
	private String userId_fk;
	
	//선정된 기부 단체 번호
	private int donOrgNum_fk;
	
	//선정된 기부 단체 이름
	private String donOrgName;
	
	//기부 금액
	private int donAmount;
	
	//기부종류(경매통한기부=1, 포인트통한기부=2)
	private int donationType;
	
	//기부날짜
	private Date donationTime;
}
