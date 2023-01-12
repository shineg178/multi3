package three.team.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;
import three.donation.model.DonationVO;
import three.donation.service.DonationService;

@Controller
@Log4j
public class DonationController {

	@Autowired
	private DonationService donationService;

	// donation 기부 페이지 메서드
	@RequestMapping(value = "/donation", method = RequestMethod.GET)
	public String donationForm(Model m) {
		//기부페이지 상단 거래수와 총기부금액
		log.info("==========donationForm==========");
		m.addAttribute("totalDonation", donationService.totalDonation());
		m.addAttribute("totalDonateCount", donationService.totalDonateCount());
		m.addAttribute("donationUserCount", donationService.donationUserCount());
		//기부 순위, 기부단체설명
		m.addAttribute("userListDonate", donationService.userListDonate());
		m.addAttribute("donationOrgInfo", donationService.donationOrgInfo());
		System.out.println(m);
		return "donation/donation";
	}

	// 기부 페이지 내 기부자 순위 검색
	@GetMapping(value = "/donationRankingSearch", produces = "application/json")
	@ResponseBody
	public int donationRankingId(@RequestParam String userId) {
		log.info("userId: " + userId);

		String user=donationService.donationRankingId(userId);
		if(user==null) {
			return 0;
		}

		return Integer.parseInt(user);

	}

}
