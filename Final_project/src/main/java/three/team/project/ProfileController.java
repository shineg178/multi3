package three.team.project;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import three.auction.model.AuctionEndVO;
import three.auction.model.AuctionSurveyVO;
import three.chat.model.ChatAlertVO;
import three.chat.model.ChatRoomVO;
import three.chat.model.ChatVO;
import three.chat.service.ChatService;
import three.donation.model.DonateVO;
import three.donation.model.DonationOrgVO;
import three.exchange.model.ExchangeVO;
import three.payment.model.PaymentVO;
import three.product.model.ProductVO;
import three.profile.service.ProfileService;
import three.report.model.ReportVO;
import three.security.SHA256.UserSHA256;
import three.user.model.UserVO;

@Controller
@Log4j
public class ProfileController {
	
	@Inject
	private ProfileService profileServiceImpl;
	
	@Inject
	private ChatService chatServiceImpl;
	
	@GetMapping("/users-profile")
	public String userProfile(Model m, HttpSession ses) { 
		UserVO user=(UserVO)ses.getAttribute("user");
		if (user == null) {
			return "redirect:/";
		}
		String userid=user.getUserId();
		
		int totalDonate =profileServiceImpl.myTotalDonation(userid);
		
		if(totalDonate != 0) {
			int mygoldBg=totalDonate/100000;
			int mysilverBg=totalDonate%100000/50000;
			int mybronzeBg=totalDonate%100000%50000/10000;
			
			UserVO vo=new UserVO();
			vo.setUserId(userid);
			vo.setUserGoldBadge(mygoldBg);
			vo.setUserSilverBadge(mysilverBg);
			vo.setUserBronzeBadge(mybronzeBg);
			
			profileServiceImpl.updateBadge(vo);
			
			log.info("???"+mygoldBg+"???"+mysilverBg+"???"+mybronzeBg);
		}
		
		List<AuctionEndVO> aucvo=profileServiceImpl.myAuction(userid);
		
		//?????? ??????
		double avrScore=this.profileServiceImpl.getAverage(userid);
		m.addAttribute("average",avrScore);
		log.info(avrScore);
		
		UserVO vo=profileServiceImpl.findUserByUserId(userid);
		ses.setAttribute("user", vo);
		m.addAttribute("user",vo);
		m.addAttribute("myList",aucvo);
		
		return "users-profile";
	}
	
	//?????? ??????
	@GetMapping("/tradeOK")
	public String tradeOK(@RequestParam int aucEndNum,HttpSession ses) {
		
		//?????? ?????? ?????? ????????????
		AuctionEndVO aucvo=profileServiceImpl.findAuctionEnd(aucEndNum);
		
		//?????? ????????? ?????? ?????? ???????????? 
		int prodNum=aucvo.getProdNum_fk();
		ProductVO pvo=profileServiceImpl.findProductByNum(prodNum);
		
		int donatePer=pvo.getDonatePercent();//?????? ??????		
		int totalPrice=aucvo.getEndPrice();	//?????? ?????? ??????
		int donateAmount=totalPrice*donatePer/100;//?????????	
		int restPoint=totalPrice-donateAmount;//????????? ????????? ????????? 
		
		//?????? ?????? ?????? ?????? ????????????
		DonationOrgVO orgvo=profileServiceImpl.findOrgInfo();
		
		//????????? ?????????, ????????????, ???????????? ... ????????? ??????
		DonateVO dvo=new DonateVO();
		
		dvo.setDonOrgNum_fk(orgvo.getDonOrgNum());//???????????? ??????
		dvo.setDonOrgName(orgvo.getDonName());//???????????? ??????
		dvo.setUserId_fk(aucvo.getSellId());//????????? ????????? 
		dvo.setDonationType(1);//1: ????????? ?????? ?????? , 2: ???????????? ?????? ??????
		dvo.setDonAmount(donateAmount);//?????? ??????
		
		//?????? DB??? ??????
		int a=profileServiceImpl.addDonation(dvo);
		log.info("???????????? : "+a);
		
		UserVO sellvo=new UserVO();
		sellvo.setUserId(aucvo.getSellId());
		sellvo.setUserPoint(restPoint);
		//????????? ?????? ????????? ?????? ???????????? ??????
		int r=profileServiceImpl.addPoint(sellvo);
		log.info("????????? ?????? : "+r);
		
		UserVO uvo=(UserVO)ses.getAttribute("user");
		String myId=uvo.getUserId();
		String buyId=aucvo.getBuyId();
		String sellId=aucvo.getSellId();
		if(myId.equals(buyId)) {
			
			//??????????????? ?????? ??????
			int n=profileServiceImpl.aucEndupdateStatus(aucEndNum);
			
			//????????? ??????
			ChatRoomVO buyChatRoom=new ChatRoomVO(0,"?????????",buyId);
			int buyRoom=chatServiceImpl.createRoom(buyChatRoom);
			int buyRoomId=chatServiceImpl.findChatRoomIdById(buyChatRoom);
			ChatVO buyChat=new ChatVO(buyRoomId,"?????????",buyId," ?????? ????????? ?????????????????????",null,null);
			chatServiceImpl.insertMessage(buyChat);
			ChatAlertVO buyAlert=new ChatAlertVO(buyRoomId,buyId,1);
			chatServiceImpl.addNoReadCount(buyAlert);
			buyChat.setSendMsg("????????????????????? "+sellId+"????????? ????????? ?????? ????????? ????????????~");
			chatServiceImpl.insertMessage(buyChat);
			ChatAlertVO buyAlert2=new ChatAlertVO(buyRoomId,buyId,1);
			chatServiceImpl.addNoReadCount(buyAlert2);
			
			//????????? ??????
			ChatRoomVO sellChatRoom=new ChatRoomVO(0,"?????????",sellId);
			int sellRoom=chatServiceImpl.createRoom(sellChatRoom);
			int sellRoomId=chatServiceImpl.findChatRoomIdById(sellChatRoom);
			ChatVO sellChat=new ChatVO(sellRoomId,"?????????",sellId,"?????? ????????? ?????????????????????",null,null);
			chatServiceImpl.insertMessage(sellChat);
			ChatAlertVO sellAlert=new ChatAlertVO(sellRoomId,sellId,1);
			chatServiceImpl.addNoReadCount(sellAlert);
			sellChat.setSendMsg(donateAmount+"???????????? ???????????????,");
			chatServiceImpl.insertMessage(sellChat);
			ChatAlertVO sellAlert2=new ChatAlertVO(sellRoomId,sellId,1);
			chatServiceImpl.addNoReadCount(sellAlert2);
			sellChat.setSendMsg(restPoint+"???????????? ??????????????????.");
			chatServiceImpl.insertMessage(sellChat);
			ChatAlertVO sellAlert3=new ChatAlertVO(sellRoomId,sellId,1);
			chatServiceImpl.addNoReadCount(sellAlert3);
			sellChat.setSendMsg("????????????????????? "+buyId+"????????? ????????? ?????? ????????? ????????????~");
			chatServiceImpl.insertMessage(sellChat);
			ChatAlertVO sellAlert4=new ChatAlertVO(sellRoomId,sellId,1);
			chatServiceImpl.addNoReadCount(sellAlert4);
			log.info("???????????? :"+n);
		}
		
		
		return "redirect:/users-profile";
	}
	
	//???????????? & ??????????????????
	@PostMapping(value="/users-profile/payment")
	@ResponseBody
	public Map<String, Object> requestPayment (@RequestBody Map<String, Object> map, HttpSession ses,
			Model m) {
		String imp_uid=map.get("imp_uid").toString();
		String merchant_uid=map.get("merchant_uid").toString();
		String buyer_email=map.get("buyer_email").toString();
		String buyer_id=map.get("buyer_id").toString();
		int paid_amount=Integer.parseInt(map.get("paid_amount").toString());
		
		PaymentVO vo=new PaymentVO(merchant_uid,imp_uid,buyer_email,buyer_id,paid_amount,null);
		
		int addPayment=this.profileServiceImpl.insertPayment(vo);
		int plusPoint=this.profileServiceImpl.plusPoint(vo);
		
		UserVO user=this.profileServiceImpl.findUserByUserId(buyer_id);
		ses.setAttribute("user", user);
		m.addAttribute("user",user);
		m.addAttribute("payment",vo);
		
		return map;
		
	}
	//???????????? & ???????????? ??????
	@PostMapping("/users-profile/exchange")
	@ResponseBody
	public Map<String, Object> exchange(@RequestBody Map<String, Object> map, HttpSession ses,
			Model m) {
		String bankName=map.get("bankName").toString();
		String bankAccountNum=map.get("bankAccountNum").toString();
		String userName=map.get("userName").toString();
		String userEmail=map.get("userEmail").toString();
		String userid=map.get("userId").toString();
		int exchangePoint=Integer.parseInt(map.get("exchangePoint").toString());
		
		if(bankName==null || bankAccountNum==null || userName==null || exchangePoint < 1000 ) {
			return null;
		}
		
		ExchangeVO vo=new ExchangeVO(0,bankName,bankAccountNum,userName,userEmail,userid,exchangePoint,null,0);
		int insertExchange=this.profileServiceImpl.addExchange(vo);
		int minusPoint=this.profileServiceImpl.minusPointByExchange(vo);
		
		UserVO user=this.profileServiceImpl.findUserByUserId(userid);
		ses.setAttribute("user", user);
		m.addAttribute("user",user);
		m.addAttribute("exchange",vo);
		return map;
	}
	//???????????? ??????
		@PostMapping("/users-profile/donate")
		@ResponseBody
		public Map<String, Object> donate(@RequestBody Map<String, Object> map, HttpSession ses,
				Model m) {
			String userId=map.get("userId").toString();
			int donAmount=Integer.parseInt(map.get("donAmount").toString());
			int donOrgNum=this.profileServiceImpl.getDonOrgNum();
			String donOrgName=this.profileServiceImpl.getDonOrgName(donOrgNum);
			log.info(userId);
			log.info(donAmount);
			log.info(donOrgNum);
			if(userId==null || donAmount <100 || donOrgNum < 2000) {
				return null;
			}
			
			DonateVO dvo=new DonateVO(0,userId,donOrgNum,donOrgName,donAmount,2,null);
			int insertDonate=this.profileServiceImpl.addDonation(dvo);
			int minusPoint=this.profileServiceImpl.minusPointByDonation(dvo);
			
			UserVO user=this.profileServiceImpl.findUserByUserId(userId);
			ses.setAttribute("user", user);
			m.addAttribute("user",user);
			
			return map;
		}

	//????????????????????????
	@GetMapping(value="/users-profile/rechargeList", produces = "application/json")
	@ResponseBody
	public List<PaymentVO> rechargeList(String userId, Model m){
		log.info("userId==="+userId);
		List<PaymentVO> payList=new ArrayList<PaymentVO>();
		payList=this.profileServiceImpl.findPaymentByUserId(userId);
		m.addAttribute("payList",payList);
		return payList;
	}
	//????????? ?????? ?????????
	@GetMapping(value="/users-profile/exchangeList", produces = "application/json")
	@ResponseBody
	public List<ExchangeVO> exchangeList(String userId, Model m){
		log.info("userId==="+userId);
		List<ExchangeVO> exList=new ArrayList<ExchangeVO>();
		exList=this.profileServiceImpl.findExchangeByUserId(userId);
		m.addAttribute("exList",exList);
		return exList;
	}
	//????????? ?????? ?????????
	@GetMapping(value="/users-profile/donateList", produces = "application/json")
	@ResponseBody
	public List<DonateVO> donateList(String userId, Model m){
		log.info("userId==="+userId);
		List<DonateVO> doList=new ArrayList<DonateVO>();
		doList=this.profileServiceImpl.findDonationByUserId(userId);
		m.addAttribute("doList",doList);
		return doList;
	}
	//????????????????????????&??????
	@PostMapping("/users-profile/updateImg")
	public String updateImg(@RequestParam("userImage") MultipartFile file, 
			@RequestParam("userNum") int userNum,
			Model m, HttpSession ses) {
		
		ServletContext app=ses.getServletContext();
		String upDir=app.getRealPath("/resources/User_Image");
		log.info(upDir);
		File dir=new File(upDir);
		if(!dir.exists()){
			dir.mkdirs();
		}
		if(file != null) {
			//?????? ???????????? ?????? ????????????
			UserVO vo=this.profileServiceImpl.findUserByuserNum(userNum);
			String oldFileName=vo.getUserImage();//?????? ????????????
			
			//?????? ????????? ???????????? ?????? ?????? ??????
			if(oldFileName!=null) {
				File delf=new File(upDir,oldFileName);
				if(delf.exists()) {
					delf.delete();
				}
			}
			
			String originFname=file.getOriginalFilename();
			UUID uuid=UUID.randomUUID();
			String newfilename=uuid.toString()+"_"+originFname;
			
			//????????? vo ????????? ?????? ?????? ??????
			vo.setUserImage(newfilename);
			
			//????????? ????????? ?????????
			try {
				file.transferTo(new File(upDir,newfilename));
			}catch(Exception e) {
				log.error(e);
			}
			
			int n=profileServiceImpl.updateUserImage(vo);
			log.info(n);
			
			ses.setAttribute("user", vo);
			m.addAttribute("user",vo);
		}
		return "redirect:/users-profile";
	}
	//?????????????????? 
//	String encryPwd=UserSHA256.encrypt(user.getUserPassword());
//	user.setUserPassword(encryPwd);
	@PostMapping("/users-profile/updateProfile/loginCheck")
	@ResponseBody
	public String passwordCheck(@RequestParam("userNum") int userNum,
			@RequestParam("password") String password, Model m) {
		String encryPwd=UserSHA256.encrypt(password);
		
		String realPassword=this.profileServiceImpl.getPassword(userNum);
		String code;
		if(realPassword.equals(encryPwd) ) {
			code="success";
		}else {
			code="fail";
		}
		return code;
	}
	//?????????????????? 
	@PostMapping("/users-profile/updateProfile")
	@ResponseBody
	public Map<String, Object> updateProfile(@RequestBody Map<String, Object> map,
	Model m, HttpSession ses) {
		int userNum=Integer.parseInt(map.get("userNum").toString());
		String userInfo=map.get("userInfo").toString();
		String userNick=map.get("userNick").toString();
		String userAddr1=map.get("userAddr1").toString();
		String userAddr2=map.get("userAddr2").toString();
		String userAddr3=map.get("userAddr3").toString();
		String userTel=map.get("userTel").toString();
		String userEmail=map.get("userEmail").toString();
		
		UserVO vo=(UserVO)ses.getAttribute("user");
		vo.setUserAddr1(userAddr1);
		vo.setUserAddr2(userAddr2);
		vo.setUserAddr3(userAddr3);
		vo.setUserEmail(userEmail);
		vo.setUserInfo(userInfo);
		vo.setUserNick(userNick);
		
		int updateProfile=this.profileServiceImpl.updateProfile(vo);
		
		ses.setAttribute("user", vo);
		m.addAttribute("user",vo);
		return map;
	}
	//???????????? ??????
	@PostMapping("/users-profile/updatePassword")
	@ResponseBody
	public Map<String, String> updatePassword(@RequestParam("newPassword") String newPassword, HttpSession ses) {
		//log.info(newPassword);
		UserVO vo=(UserVO)ses.getAttribute("user");
		String encryPwd=UserSHA256.encrypt(newPassword);
		vo.setUserPassword(encryPwd);
		int updatePassword=this.profileServiceImpl.updatePassword(vo);
		Map<String, String> map=new HashMap<>();
		ses.setAttribute("user", vo);
		map.put("password",newPassword);
		return map;
	}
	//??????????????????
	@PostMapping("/users-profile/deleteUser")
	@ResponseBody
	public Map<String, String> deleteUser(@RequestParam("userNum") int userNum, HttpSession ses) {
		Map<String, String> map=new HashMap<>();
		UserVO user=(UserVO)ses.getAttribute("user");
		int deleteUser=this.profileServiceImpl.deleteUser(user);
		ses.removeAttribute("user");
		return map;
	}
	
	//?????? ??????
	@PostMapping("/users-profile/insertReview")
	public String insertReview(HttpServletRequest request,Model m) {
		String doUserId=request.getParameter("doUserId");
		String takeUserId=request.getParameter("takeUserId");
		String review=request.getParameter("review");
		int aucEndNum=Integer.parseInt(request.getParameter("aucEndNum"));
		int score=Integer.parseInt(request.getParameter("score"));
		AuctionSurveyVO vo=new AuctionSurveyVO(aucEndNum,doUserId,takeUserId,score,review);
		
		AuctionEndVO endvo=this.profileServiceImpl.findAuctionEnd(aucEndNum);
		
		String buyId=endvo.getBuyId();
		String sellId=endvo.getSellId();
		
		if(endvo.getAucStatus()==1) {
			if(doUserId.equals(sellId)) {
				int n=this.profileServiceImpl.insertSurvey(vo);
				endvo.setAucStatus(3);
				int a=this.profileServiceImpl.aucEndUpdate(endvo);
			}else if(doUserId.equals(buyId)) {
				int n=this.profileServiceImpl.insertSurvey(vo);
				endvo.setAucStatus(2);
				int a=this.profileServiceImpl.aucEndUpdate(endvo);
			}
		}else if(endvo.getAucStatus()==2) {
			int n=this.profileServiceImpl.insertSurvey(vo);
			endvo.setAucStatus(4);
			int a=this.profileServiceImpl.aucEndUpdate(endvo);
		}else if(endvo.getAucStatus()==3) {
			int n=this.profileServiceImpl.insertSurvey(vo);
			endvo.setAucStatus(4);
			int a=this.profileServiceImpl.aucEndUpdate(endvo);
		}
		
		m.addAttribute("survey",vo);
		
		return "redirect:/users-profile";
	}
	
	//????????????
	@PostMapping("/users-profile/reportUser")
	public String reportUser(HttpServletRequest request,Model m) {
		int aucEndNum=Integer.parseInt(request.getParameter("aucEndNum"));
		String userId=request.getParameter("userId"); //?????????
		String reportedUserId=request.getParameter("reportedUserId"); //?????????????????????
		String reportContent=request.getParameter("reportContent");
		
		ReportVO rvo=new ReportVO(0,aucEndNum,userId,reportedUserId,reportContent,0);
		
		this.profileServiceImpl.insertReport(rvo);
		
		return "redirect:/users-profile";
	}
	
}