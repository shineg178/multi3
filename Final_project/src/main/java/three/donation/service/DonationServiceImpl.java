package three.donation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.donation.mapper.DonationMapper;
import three.donation.model.DonationOrgVO;
import three.donation.model.DonationVO;

@Service("donationService")
public class DonationServiceImpl implements DonationService {
 
	@Autowired
	private DonationMapper donationMapper;
	
	// 전체 기부 금액
	@Override 
	public int totalDonation() { 
		return this.donationMapper.totalDonation(); 
	}
	// 전체 기부 건수
	@Override
	public int totalDonateCount() {
		return this.donationMapper.totalDonateCount();
	}
	// 기부자 목록
	@Override
	public List<DonationVO> userListDonate() {
		return this.donationMapper.userListDonate();
	}
	// 기부자 순위 검색
	@Override
	public String donationRankingId(String userId){	
		return this.donationMapper.donationRankingId(userId); 
	}
	//기부단체설명
	@Override
	public List<DonationOrgVO> donationOrgInfo() {
		return donationMapper.donationOrgInfo();
	}
	@Override
	public int donationUserCount() {
		return donationMapper.donationUserCount();
	}


}
