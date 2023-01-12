package three.donation.service;

import java.util.List;

import three.donation.model.DonationOrgVO;
import three.donation.model.DonationVO;


public interface DonationService {

	// 전체 기부 금액
	int totalDonation();
	// 전체 기부 건수
	int totalDonateCount();
	// 기부자 목록
	List<DonationVO> userListDonate();
	// 기부자 순위 검색
	String donationRankingId(String userId);
	//기부단체설명
	List<DonationOrgVO> donationOrgInfo();
	//기부순위에서 기부자수만큼 반복돌리려는 목적
	int donationUserCount();

}
