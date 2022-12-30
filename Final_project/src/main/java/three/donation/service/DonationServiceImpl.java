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
	
	@Override 
	public int totalDonation() { 
		return this.donationMapper.totalDonation(); 
	}
	
	@Override
	public int totalDonateCount() {
		return this.donationMapper.totalDonateCount();
	}

	@Override
	public List<DonationVO> userListDonate() {
		return this.donationMapper.userListDonate();
	}
	
	@Override
	public int donationLevelId(){	
		return this.donationMapper.donationLevelId(); 
	}

	@Override
	public List<DonationOrgVO> donationOrgInfo() {
		return donationMapper.donationOrgInfo();
	}

	@Override
	public int ServiceAmount(DonationVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
