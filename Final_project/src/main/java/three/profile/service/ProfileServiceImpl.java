package three.profile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.exchange.model.ExchangeVO;
import three.payment.model.PaymentVO;
import three.profile.mapper.ProfileMapper;
import three.user.mapper.UserMapper;
import three.user.model.UserVO;

@Service("profileServiceImpl")
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private ProfileMapper profileMapper;
	
	@Override
	public UserVO findUserByuserNum(int userNum) {
		return this.userMapper.findUserByuserNum(userNum);
	}

	@Override
	public int insertPayment(PaymentVO vo) {
		return this.profileMapper.insertPayment(vo);
	}
	
	@Override
	public int plusPoint(PaymentVO vo) {
		return this.profileMapper.plusPoint(vo);
	}
	
	@Override
	public int addExchange(ExchangeVO vo) {
		return this.profileMapper.addExchange(vo);
	}
	
	@Override
	public int minusPoint(ExchangeVO vo) {
		return this.profileMapper.minusPoint(vo);
	}
	
	@Override
	public List<PaymentVO> findPaymentByUserId(String userId) {
		return this.profileMapper.findPaymentByUserId(userId);
	}
	
	@Override
	public List<ExchangeVO> findExchangeByUserId(String userId) {
		return this.profileMapper.findExchangeByUserId(userId);
	}

}
