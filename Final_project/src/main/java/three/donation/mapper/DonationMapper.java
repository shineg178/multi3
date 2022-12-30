package three.donation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import three.donation.model.DonationOrgVO;
import three.donation.model.DonationVO;


@Mapper
@Repository
public interface DonationMapper {
	// 전체 기부 금액
	int totalDonation();

	// 전체 기부 건수
	int totalDonateCount();

	// 기부자 목록(기부금액 높은 순으로 금액, 아이디 출력)
	List<DonationVO> userListDonate();

	// 기부자 순위 검색
	int donationLevelId();

	//기부단체설명
	List<DonationOrgVO> donationOrgInfo();

	
}
