package three.profile.mapper;

import java.util.List;

import three.exchange.model.ExchangeVO;
import three.payment.model.PaymentVO;

public interface ProfileMapper {
	
	int insertPayment(PaymentVO vo);	
	
	int plusPoint(PaymentVO vo);
	
	int addExchange(ExchangeVO vo);
	
	int minusPoint(ExchangeVO vo);
	
	List<PaymentVO> findPaymentByUserId(String userId);
	
	List<ExchangeVO> findExchangeByUserId(String userId);
}
