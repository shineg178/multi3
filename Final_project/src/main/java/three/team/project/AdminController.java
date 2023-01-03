package three.team.project;

import java.util.List;

import javax.inject.Inject;

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

//관리자 페이지 컨트롤러
@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Inject
	private AdminService adminServiceImpl;
	
	//관리자 페이지 이동
	@GetMapping("/adminPage")
	public String adminPage(Model m) {
		
		//메인 기부단체 정보 가져오기
		DonationOrgVO donVO=adminServiceImpl.mainOrg();
		
		//기부 단체 리스트 가져오기
		List<DonationOrgVO> orglist=adminServiceImpl.dOrgList();
		log.info(orglist);
		
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
		
		int n=adminServiceImpl.changeDon(donOrgNum);
		return "redirect:adminPage";
	}
	
	
}
