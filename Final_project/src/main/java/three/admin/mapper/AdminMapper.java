package three.admin.mapper;

import java.util.List;

import three.donation.model.DonationOrgVO;
import three.exchange.model.ExchangeVO;
import three.payment.model.PaymentVO;
import three.product.model.ProductVO;
import three.user.model.UserVO;

public interface AdminMapper {
	
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
	
	//환불 요청 내역 가져오기
	List<ExchangeVO> exchangeList();
	
	//환불요청 삭제하기
	int exchangeDelete(int exchangeNum);
	
	//결제 내역 가져오기
	List<PaymentVO> payList();
	
	//결제 내역 취소하기
	int cancelPay(int merchant_uid);
}
