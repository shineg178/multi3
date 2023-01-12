package three.profile.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.auction.model.AuctionEndVO;
import three.donation.model.DonateVO;
import three.donation.model.DonationOrgVO;
import three.exchange.model.ExchangeVO;
import three.payment.model.PaymentVO;
import three.product.model.ProductVO;
import three.profile.mapper.ProfileMapper;
import three.user.mapper.UserMapper;
import three.user.model.UserVO;

@Service("profileServiceImpl")
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private ProfileMapper profileMapper;
	
	//유저찾기
	@Override
	public UserVO findUserByuserNum(int userNum) {
		return this.userMapper.findUserByuserNum(userNum);
	}
	//결제정보저장
	@Override
	public int insertPayment(PaymentVO vo) {
		return this.profileMapper.insertPayment(vo);
	}
	//포인트충전
	@Override
	public int plusPoint(PaymentVO vo) {
		return this.profileMapper.plusPoint(vo);
	}
	//환전요청저장
	@Override
	public int addExchange(ExchangeVO vo) {
		return this.profileMapper.addExchange(vo);
	}
	//포인트차감-환전
	@Override
	public int minusPointByExchange(ExchangeVO vo) {
		return this.profileMapper.minusPointByExchange(vo);
	}
	//결제정보리스트
	@Override
	public List<PaymentVO> findPaymentByUserId(String userId) {
		return this.profileMapper.findPaymentByUserId(userId);
	}
	//환전정보리스트
	@Override
	public List<ExchangeVO> findExchangeByUserId(String userId) {
		return this.profileMapper.findExchangeByUserId(userId);
	}
	//기부정보리스트
	@Override
	public List<DonateVO> findDonationByUserId(String userId) {
		return this.profileMapper.findDonationByUserId(userId);
	}
	//기부단체번호가져오기
	@Override
	public int getDonOrgNum() {
		return this.profileMapper.getDonOrgNum();
	}
	//기부단체이름가져오기
	@Override
	public String getDonOrgName(int donOrgNum) {
		return this.profileMapper.getDonOrgName(donOrgNum);
	}
	//기부정보저장
	@Override
	public int addDonation(DonateVO dvo){
		return this.profileMapper.addDonation(dvo);
	}
	//포인트차감-기부
	@Override
	public int minusPointByDonation(DonateVO dvo) {
		return this.profileMapper.minusPointByDonation(dvo);
	}
	//프로필이미지수정
	@Override
	public int updateUserImage(UserVO vo) {
		return this.profileMapper.updateUserImage(vo);
	}
	//비밀번호가져오기
	@Override
	public String getPassword(int userNum) {
		return this.profileMapper.getPassword(userNum);
	}
	//프로필정보수정
	@Override
	public int updateProfile(UserVO vo) {
		return this.profileMapper.updateProfile(vo);
	}
	//비밀번호수정
	@Override
	public int updatePassword(UserVO vo) {
		return this.profileMapper.updatePassword(vo);
	}
	//탈퇴회원전환
	@Override
	public int deleteUser(UserVO vo) {
		return this.profileMapper.deleteUser(vo);
	}
	//경매 참여 내역
	@Override
	public List<AuctionEndVO> myAuction(String userid) {
		return profileMapper.myAuction(userid);
	}
	@Override
	public AuctionEndVO findAuctionEnd(int aucEndNum) {
		return profileMapper.findAuctionEnd(aucEndNum);
	}
	@Override
	public int aucEndupdateStatus(int aucEndNum) {
		return profileMapper.aucEndupdateStatus(aucEndNum);
	}
	@Override
	public ProductVO findProductByNum(int prodNum) {
		return profileMapper.findProductByNum(prodNum);
	}
	@Override
	public DonationOrgVO findOrgInfo() {
		return profileMapper.findOrgInfo();
	}
	@Override
	public int addPoint(UserVO vo) {
		return profileMapper.addPoint(vo);
	}
	@Override
	public int myTotalDonation(String userid) {
		return profileMapper.myTotalDonation(userid);
	}
	@Override
	public int updateBadge(UserVO vo) {
		return profileMapper.updateBadge(vo);
	}

}
