package three.admin.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import three.admin.mapper.AdminMapper;
import three.donation.model.DonateVO;
import three.donation.model.DonationOrgVO;
import three.exchange.model.ExchangeVO;
import three.payment.model.PaymentVO;
import three.product.model.ProdCategoryVO;
import three.product.model.ProductVO;
import three.user.model.UserVO;

@Log4j
@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminMapper adminMapper;
	
	@Override
	public List<DonationOrgVO> dOrgList() {
		return adminMapper.dOrgList();
	}

	@Override
	public List<UserVO> userList() {
		return adminMapper.userList();
	}

	@Override
	public List<ProductVO> productList() {
		return adminMapper.productList();
	}

	@Override
	public DonationOrgVO mainOrg() {
		return adminMapper.mainOrg();
	}

	@Override
	public int addOrg(DonationOrgVO vo) {
		return adminMapper.addOrg(vo);
	}

	@Override
	public int dondelete(int donOrgNum) {
		return adminMapper.dondelete(donOrgNum);
	}

	@Override
	public int changeDon(int donOrgNum) {
		return adminMapper.changeDon(donOrgNum);
	}

	@Override
	public List<ExchangeVO> exchangeList() {
		return adminMapper.exchangeList();
	}

	@Override
	public int exchangeDelete(int exchangeNum) {
		return adminMapper.exchangeDelete(exchangeNum);
	}
	
	@Override
	public int changeStatus(int num) {
		return adminMapper.changeStatus(num);
	}
	
	@Override
	public int cancelchangeStatus(int exchangeNum) {
		return adminMapper.cancelchangeStatus(exchangeNum);
	}
	
	@Override
	public List<PaymentVO> payList() {
		return adminMapper.payList();
	}

	@Override
	public int cancelPay(String merchant_uid) {
		return adminMapper.cancelPay(merchant_uid);
	}

	@Override
	public int normalUser(int userNum) {
		return adminMapper.normalUser(userNum);
	}

	@Override
	public int stopUser(int userNum) {
		return adminMapper.stopUser(userNum);
	}

	@Override
	public List<UserVO> findUser(String userId) {
		return adminMapper.findUser(userId);
	}

	@Override
	public int resetPoint(PaymentVO vo) {
		return adminMapper.resetPoint(vo);
	}

	@Override
	public PaymentVO findPayment(String num) {
		return adminMapper.findPayment(num);
	}

	@Override
	public ExchangeVO findExchange(int num) {
		return adminMapper.findExchange(num);
	}

	@Override
	public int rechargePoint(ExchangeVO vo) {
		return adminMapper.rechargePoint(vo);
	}

	@Override
	public int prodDelete(int prodNum) {
		return adminMapper.prodDelete(prodNum);
	}

	@Override
	public List<ProductVO> adminFindProd(String prodName) {
		return adminMapper.adminFindProd(prodName);
	}

	@Override
	public int socialUser(int userNum) {
		return adminMapper.socialUser(userNum);
	}

	@Override
	public List<DonateVO> donList() {
		return adminMapper.donList();
	}

	@Override
	public int donateEnd(DonateVO vo) {
		return adminMapper.donateEnd(vo);
	}

	@Override
	public DonateVO findOrg(DonateVO vo) {
		return adminMapper.findOrg(vo);
	}

	@Override
	public int donateUpdate(DonateVO vo) {
		return adminMapper.donateUpdate(vo);
	}

	@Override
	public List<DonateVO> endDonateList() {
		return adminMapper.endDonateList();
	}

	@Override
	public List<ProdCategoryVO> categoryList() {
		return adminMapper.categoryList();
	}


}
