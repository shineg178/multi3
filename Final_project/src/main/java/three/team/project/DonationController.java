package three.team.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import three.donation.service.DonationService;

@Controller
@Log4j
public class DonationController {

	@Autowired
	private DonationService donationService;

	// donation 기부 페이지 메서드
	@RequestMapping(value = "/donation", method=RequestMethod.GET)
	public String donationForm(Model m) {
		log.info("==========donationForm==========");
		m.addAttribute("totalDonation", donationService.totalDonation());
		m.addAttribute("totalDonateCount", donationService.totalDonateCount());
		
		m.addAttribute("userListDonate", donationService.userListDonate());
		m.addAttribute("donationOrgInfo", donationService.donationOrgInfo());
		System.out.println(m);
		return "donation/donation";
	}

	@GetMapping(value = "/donationLevelSearch", produces = "application/json")
	@ResponseBody
	public String donationLevelId(@RequestParam String userId) {// 기부자 기부순위
		log.info("userId: "+userId);

		return userId;
	}
	
	
	
	
}
