package three.team.project;

import java.util.List;

import javax.inject.Inject;

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
import three.donation.model.DonationOrgVO;
import three.exchange.model.ExchangeVO;
import three.mail.service.MailService;
import three.payment.model.PaymentVO;

//관리자 페이지 컨트롤러
@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Inject
	private AdminService adminServiceImpl;
	
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
		
		m.addAttribute("pay",payList);
		m.addAttribute("exchange",exList);
		m.addAttribute("main",donVO);
		m.addAttribute("Org",orglist);
		
		return "admin/adminPage";
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
		
		adminServiceImpl.exchangeDelete(num);
		
		return "redirect:adminPage";
	}
	
	//환불요청 삭제
	@GetMapping("/deleteExchange")
	public String deleteExchange(@RequestParam int num) {
		
		adminServiceImpl.exchangeDelete(num);
				
		return "redirect:adminPage";
	}
	
	//결제 내역 취소
	@GetMapping("/cancelPay")
	public String cancelPay(@RequestParam int num) {
		
		adminServiceImpl.cancelPay(num);
		
		return "redirect:adminPage";
	}
	
}
