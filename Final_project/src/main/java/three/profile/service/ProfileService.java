package three.profile.service;

import java.util.List;

import three.auction.model.AuctionEndVO;
import three.donation.model.DonateVO;
import three.exchange.model.ExchangeVO;
import three.payment.model.PaymentVO;
import three.product.model.ProductVO;
import three.user.model.UserVO;

public interface ProfileService {
	//유저찾기
	UserVO findUserByuserNum(int userNum);
	//결제정보저장
	int insertPayment(PaymentVO vo);	
	//포인트충전
	int plusPoint(PaymentVO vo);
	//환전요청저장
	int addExchange(ExchangeVO vo);
	//포인트차감-환전
	int minusPointByExchange(ExchangeVO vo);
	//결제정보리스트
	List<PaymentVO> findPaymentByUserId(String userId);
	//환전정보리스트
	List<ExchangeVO> findExchangeByUserId(String userId);
	//기부정보리스트
	List<DonateVO> findDonationByUserId(String userId);
	//기부단체번호가져오기
	int getDonOrgNum();
	//기부단체이름가져오기
	String getDonOrgName(int donOrgNum);
	//기부정보저장
	int addDonation(DonateVO dvo);
	//포인트차감-기부
	int minusPointByDonation(DonateVO dvo);
	//프로필이미지수정
	int updateUserImage(UserVO vo);
	//비밀번호가져오기
	String getPassword(int userNum);
	//프로필정보수정
	int updateProfile(UserVO vo);
	//비밀번호수정
	int updatePassword(UserVO vo);
	//탈퇴회원전환
	int deleteUser(UserVO vo);
	//경매 참여 내역
	List<AuctionEndVO> myAuction(String userid);
	//번호로 경매 종료 정보 가져오기
	AuctionEndVO findAuctionEnd(int aucEndNum);
	//거래완료 상태 변경
	int aucEndupdateStatus(int aucEndNum);
	
}
