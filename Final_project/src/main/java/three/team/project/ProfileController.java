package three.team.project;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;
import three.exchange.model.ExchangeVO;
import three.payment.model.PaymentVO;
import three.profile.service.ProfileService;
import three.user.model.UserVO;

@Controller
@Log4j
public class ProfileController {
	
	@Inject
	private ProfileService profileServiceImpl;
	
	@GetMapping("/users-profile")
	public String userProfile(Model m, @RequestParam(defaultValue = "0") int userNum, HttpSession ses) { 
//		if (userNum == 0) {
//			return "redirect:/";
//		}
		ses.setAttribute("userNum", userNum);
		log.info("userNum:"+userNum);
		UserVO user=this.profileServiceImpl.findUserByuserNum(userNum);
		
		m.addAttribute("user",user);
		return "users-profile";
	}
	
	@PostMapping(value="/users-profile/payment")
	@ResponseBody
	public Map<String, Object> requestPayment (
			@RequestBody Map<String, Object> map,
			Model m) {
		String imp_uid=map.get("imp_uid").toString();
		String merchant_uid=map.get("merchant_uid").toString();
		String buyer_email=map.get("buyer_email").toString();
		String buyer_id=map.get("buyer_id").toString();
		int paid_amount=Integer.parseInt(map.get("paid_amount").toString());
		
		PaymentVO vo=new PaymentVO(merchant_uid,imp_uid,buyer_email,buyer_id,paid_amount,null);
		
//		log.info(imp_uid);
//		log.info(merchant_uid);
//		log.info(buyer_email);
//		log.info(paid_amount);
//		log.info("vo==="+vo);
		
		int n=this.profileServiceImpl.insertPayment(vo);
		int a=this.profileServiceImpl.plusPoint(vo);
		m.addAttribute("payment",vo);
		
		return map;
		
	}

	@PostMapping("/users-profile/exchange")
	@ResponseBody
	public Map<String, Object> exchange(@RequestBody Map<String, Object> map,
			Model m) {
		String bankName=map.get("bankName").toString();
		String bankAccountNum=map.get("bankAccountNum").toString();
		String userName=map.get("userName").toString();
		String userEmail=map.get("userEmail").toString();
		String userid=map.get("userId").toString();
		int exchangePoint=Integer.parseInt(map.get("exchangePoint").toString());
		
		ExchangeVO vo=new ExchangeVO(0,bankName,bankAccountNum,userName,userEmail,userid,exchangePoint,null);
		int n=this.profileServiceImpl.addExchange(vo);
		int a=this.profileServiceImpl.minusPoint(vo);
		m.addAttribute("exchange",vo);
		return map;
	}
	
	@GetMapping(value="/users-profile/rechargeList", produces = "application/json")
	@ResponseBody
	public List<PaymentVO> rechargeList(String userId, Model m){
		log.info("userId==="+userId);
		List<PaymentVO> payList=new ArrayList<PaymentVO>();
		payList=this.profileServiceImpl.findPaymentByUserId(userId);
		m.addAttribute("payList",payList);
		return payList;
	}
	
	@GetMapping(value="/users-profile/exchangeList", produces = "application/json")
	@ResponseBody
	public List<ExchangeVO> exchangeList(String userId, Model m){
		log.info("userId==="+userId);
		List<ExchangeVO> exList=new ArrayList<ExchangeVO>();
		exList=this.profileServiceImpl.findExchangeByUserId(userId);
		m.addAttribute("exList",exList);
		return exList;
	}
}
