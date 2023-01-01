package three.donation.model;

import lombok.Data;

@Data
public class DonationVO {
	
	
	private String donNum;//기부번호
	
	private int donOrgNum_fk;//기부단체번호
	
	private String userNum_fk;//회원번호
	
	private String totalAmount;//sum(Amount)
	
	private int rn;//전체기부 순위 번호
	
	private int donationLevelId;//기부자 아이디 검색 순위 확인 
	
	private int totalDonation;//전체 기부금액 (회원들의 donAmount 전체 합)
	
	private int totalDonateCount;//전체 기부건수

	private String userId;//사용자 아이디
	
}  
