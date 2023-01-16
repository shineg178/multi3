 package three.team.project;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;
import three.admin.service.AdminService;
import three.auction.model.AuctionEndVO;
import three.chat.model.ChatRoomVO;
import three.chat.service.ChatService;
import three.donation.model.DonateVO;
import three.donation.model.DonationOrgVO;
import three.exchange.model.ExchangeVO;
import three.mail.service.MailService;
import three.payment.model.PaymentVO;
import three.product.model.ProdCategoryVO;
import three.product.model.ProductVO;
import three.product.service.ProductService;
import three.report.model.ReportVO;
import three.user.model.UserVO;

//관리자 페이지 컨트롤러
@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Inject
	private AdminService adminServiceImpl;
	
	@Inject
	private ProductService productServiceImpl;
	
	@Inject
	private ChatService chatServiceImpl;
	
	
	@Autowired
	private MailService mailService;
	
	
	//관리자 페이지 이동
	@GetMapping("/adminPage")
	public String adminPage(Model m) {
		
		//메인 기부단체 정보 가져오기
		DonationOrgVO donVO=adminServiceImpl.mainOrg();
		
		//기부 단체 리스트 가져오기
		List<DonationOrgVO> orglist=adminServiceImpl.dOrgList();
		log.info(orglist);
		
		//환불 요청 내역 가져오기
		List<ExchangeVO> exList=adminServiceImpl.exchangeList();
		
		//결재 내역 가져오기
		List<PaymentVO> payList=adminServiceImpl.payList();
		
		//기부 내역 단체 별로 가져오기
		List<DonateVO> donList=adminServiceImpl.donList();
		
		//기부 완료 내역 가져오기
		List<DonateVO> donEndList=adminServiceImpl.endDonateList();
		
		//카테고리별 경매 수 가져오기
		List<ProdCategoryVO> cateList=adminServiceImpl.categoryList();
		
		List<ReportVO> repoList=adminServiceImpl.repoList();
		
		m.addAttribute("donEnd",donEndList);
		m.addAttribute("donate",donList);
		m.addAttribute("pay",payList);
		m.addAttribute("exchange",exList);
		m.addAttribute("main",donVO);
		m.addAttribute("Org",orglist);
		m.addAttribute("cateList",cateList);
		m.addAttribute("repoList",repoList);

		
		return "admin/adminPage";
	}
	
	@GetMapping(value="/adminAllUser",produces="application/json")
	@ResponseBody
	public List<UserVO> adminAllUser(){
		
		return adminServiceImpl.userList();
	}
	
	//기부단체 추가 폼 이동
	@GetMapping("/addOrgForm")
	public String addOrgForm() 
	{
		return "admin/addOrg";
	}
	
	//기부단체 추가
	@PostMapping("/addOrg")
	public String addOrg(@ModelAttribute DonationOrgVO vo) {
		log.info(vo);
		
		//데이터베이스에 정보 저장
		int n=adminServiceImpl.addOrg(vo);
				
		if(n<=0) {
			return "javascript:history.back()";
		}
		
		return "redirect:adminPage";
	}
	
	//기부단체 삭제
	@PostMapping("/dondelete")
	@ResponseBody
	public int donDelete(@RequestParam int donOrgNum) {

		int n=adminServiceImpl.dondelete(donOrgNum);
		return n;
	}
	
	//메인 기부단체 변경
	@GetMapping("/changeDon")
	public String changeDon(@RequestParam int donOrgNum) {
		log.info(donOrgNum);
		//기부단체 데이터 베이스 변경 
		adminServiceImpl.changeDon(donOrgNum);
		
		return "redirect:adminPage";
	}
	
	//환불처리 성공 메일 전송
	@GetMapping("/successEmail")
	public String successEmail(@RequestParam String Email,@RequestParam int num,@RequestParam int point) {
		log.info(num);
		
		
		
		//메일 전송 내용
		String addr = "dmsrb9810@gmail.com";
		String subject = "환불처리 요청";
		String body = "환불처리 요청이 정상적으로 처리되었습니다.\r\n요청하신 "+point+" 포인트가 정상 환급처리 되었습니다.\r\n환불 요청시 입력하신 계좌를 확인해 주세요";
		
		//메일 전송
		mailService.sendEmail(Email, addr, subject, body);
		

		adminServiceImpl.changeStatus(num);

		
		return "redirect:adminPage";
	}
	
	//환불요청 취소
	@GetMapping("/deleteExchange")
	public String deleteExchange(@RequestParam int num) {
		
		//번호로 환전 정보 가져오기
		ExchangeVO vo=adminServiceImpl.findExchange(num);
		
		//포인트 다시 되돌리기
		adminServiceImpl.rechargePoint(vo);
		
		//DB에서 환불요청 취소
		adminServiceImpl.cancelchangeStatus(num);
				
		return "redirect:adminPage";
	}
	
	//결제 내역 취소
	@GetMapping("/cancelPay")
	public String cancelPay(@RequestParam String num) {
		
		//결제 내역 가져오기
		PaymentVO vo=adminServiceImpl.findPayment(num);
		
		//결제 내역 정보로 포인트 다시 되돌리기
		adminServiceImpl.resetPoint(vo);
		
		//결제 취소
		adminServiceImpl.cancelPay(num);
		
		return "redirect:adminPage";
	}
	
	//회원 상태 정지로 변경
	@GetMapping("/stopUser")
	public String stopUser(@RequestParam int userNum) {
		adminServiceImpl.stopUser(userNum);
		
		return "redirect:adminPage";
	}
	
	//회원 상태 일반으로 변경
	@GetMapping("/normalUser")
	public String normalUser(@RequestParam int userNum) {
		
		adminServiceImpl.normalUser(userNum);
		
		return "redirect:adminPage";
	}
	
	//아이디 검색으로 찾기
	@PostMapping(value="/adminfindUser",produces="application/json")
	@ResponseBody
	public List<UserVO> adminfindUser(@RequestParam String userId){
		
		List<UserVO> userList=adminServiceImpl.findUser(userId);
		
		return userList;
	}
	
	//물품 목록 가져오기
	@GetMapping("/adminProdList")
	@ResponseBody
	public List<ProductVO> adminProdList(){
		List<ProductVO> list = productServiceImpl.allProduct();
		log.info(list);
		return list;
	}
	
	//물품이름으로 물품 목록 가져오기
	@PostMapping("/adminfindProd")
	@ResponseBody
	public List<ProductVO> adminFindProd(@RequestParam String prodName){
		List<ProductVO> list=adminServiceImpl.adminFindProd(prodName);
		log.info(list);
		return list;
	}
	
	//물품 삭제
	@GetMapping("/prodDelete")
	public String prodDelete(@RequestParam int prodNum) {
		adminServiceImpl.prodDelete(prodNum);
		
		return "redirect:adminPage";
	}
	
	//회원 변경
	@GetMapping("/socialUser")
	public String socialUser(@RequestParam int userNum) {
		adminServiceImpl.socialUser(userNum);
		
		return "redirect:adminPage";
	}
	
	//관리자 기부완료 
	@GetMapping("/donateEnd")
	public String donateEnd(@RequestParam String orgName,@RequestParam int amount) {
		DonateVO vo=new DonateVO();
		vo.setDonOrgName(orgName);
		vo.setDonAmount(amount);
		
		DonateVO dvo=adminServiceImpl.findOrg(vo);
		
		if(dvo == null) {
			adminServiceImpl.donateEnd(vo);
		}else if(dvo != null) {
			adminServiceImpl.donateUpdate(vo);
		}
		
		return "redirect:adminPage";
	}
	
	//신고 완료 처리
	@GetMapping("/reportComplete")
	public String reportComplete(@RequestParam int num) {
		adminServiceImpl.reportComplete(num);
		
		return "redirect:adminPage";
	}
	
	//유저와 채팅
	@GetMapping("/toUserChat")
	public String toUserChat(@RequestParam String toId,HttpSession ses) {
		
		UserVO vo=(UserVO)ses.getAttribute("user");
		String myId=vo.getUserId();
		ChatRoomVO roomvo=new ChatRoomVO(0,myId,toId);
		
		chatServiceImpl.createRoom(roomvo);
		
		return "redirect:adminPage";
	}
	
	//신고 경매 거래실패로 변경
	@GetMapping("/cancelAuction")
	public String cancelAuction(@RequestParam int aucNum) {
		
		//경매 종료 정보 가져오기
		AuctionEndVO rvo=adminServiceImpl.findAuctionEnd(aucNum);
		
		//구매자에게 포인트 돌려주기
		adminServiceImpl.addPointBuyer(rvo);
		
		adminServiceImpl.auctionStatusUpdate(aucNum);
		log.info(rvo);
		
		return "redirect:adminPage";
	}
	
}
