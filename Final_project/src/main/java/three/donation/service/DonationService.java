package three.donation.service;

import java.util.List;

import three.donation.model.DonationOrgVO;
import three.donation.model.DonationVO;


public interface DonationService {

	int ServiceAmount(DonationVO vo);
	
	int totalDonation();
	
	int totalDonateCount();
	
	List<DonationVO> userListDonate();
	
	int donationLevelId();

	
	List<DonationOrgVO> donationOrgInfo();

}
