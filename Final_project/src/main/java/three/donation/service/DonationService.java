package three.donation.service;

import java.util.List;

import three.donation.model.DonationOrgVO;
import three.donation.model.DonationVO;

public interface DonationService {

	// 경매거래 완료인 기부 금액
	int totalDonation();

	// 경매거래 완료인 기부 건수
	int totalDonateCount();

	// 포인트로 기부한 금액
	int pointDonation();

	// 포인트로 기부한 건수
	int pointDonateCount();

	// 기부자 목록
	List<DonationVO> userListDonate();

	// 기부자 순위 검색
	String donationRankingId(String userId);

	// 기부단체설명
	List<DonationOrgVO> donationOrgInfo();

	// 기부순위에서 기부자수만큼 반복돌리려는 목적
	int donationUserCount();

}
