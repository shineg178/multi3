package three.admin.service;

import java.util.List;

import three.donation.model.DonationOrgVO;
import three.product.model.ProductVO;
import three.user.model.UserVO;

public interface AdminService {
	
	//기부단체 리스트 가져오기
	List<DonationOrgVO> dOrgList();
	
	//유저 목록 가져오기
	List<UserVO> userList();
	
	//경매 제품 목록 가져오기
	List<ProductVO> productList();
	
	//지정된 기부 단체 정보 가져오기
	DonationOrgVO mainOrg();
	
	//기부단체 추가하기
	int addOrg(DonationOrgVO vo);
	
	//기부단체 삭제하기
	int dondelete(int donOrgNum);
	
	//메인 기부단체 변경하기
	int changeDon(int donOrgNum);
}
