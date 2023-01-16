package three.admin.service;

import java.util.List;

import three.donation.model.DonateVO;
import three.donation.model.DonationOrgVO;
import three.exchange.model.ExchangeVO;
import three.payment.model.PaymentVO;
import three.product.model.ProdCategoryVO;
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
	
	//환불 요청 내역 가져오기
	List<ExchangeVO> exchangeList();
	
	//환불요청 삭제하기
	int exchangeDelete(int exchangeNum);
	
	//결제 내역 가져오기
	List<PaymentVO> payList();
	
	//결제 내역 취소하기
	int cancelPay(String merchant_uid);
	
	//회원상태 일반 변경
	int normalUser(int userNum);
	
	//회원상태 정지 변경
	int stopUser(int userNum);
	
	//아이디 검색으로 회원 정보 가져오기
	List<UserVO> findUser(String userId);
	
	//결제 취소 금액 다시 포인트로 충전
	int resetPoint(PaymentVO vo);
	
	//결제 번호로 결제 정보 가져오기
	PaymentVO findPayment(String num);
	
	//환불 번호로 환불 정보 가져오기
	ExchangeVO findExchange(int num);
	
	//환불 완료 상태 변경
	int exchangeComplete(int num);
	
	//환불 취소로 다시 포인트 충전
	int rechargePoint(ExchangeVO vo);
	
	//물품 삭제
	int prodDelete(int prodNum);
	
	//관리자 물품 검색
	List<ProductVO> adminFindProd(String prodName);
	
	//소셜 회원으로 전환
	int socialUser(int userNum);
	
	//기부단체로 기부 내역 가져오기
	List<DonateVO> donList();
	
	//기부내역 처리
	int donateEnd(DonateVO vo);
	
	//단체 이름으로 단체 정보 가져오기
	DonateVO findOrg(DonateVO vo);
	
	//기부 현황 업데이트
	int donateUpdate(DonateVO vo);
	
	//기부 완료된 내역 가져오기
	List<DonateVO> endDonateList();
	
	//물품 카테고리별 경매 수 가져오기
	List<ProdCategoryVO> categoryList();
}
