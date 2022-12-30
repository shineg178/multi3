package three.team.project;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;
import three.auction.service.AuctionService;
import three.user.model.UserVO;

@Controller
@Log4j
public class ProfileController {
	
	@Inject
	private AuctionService auctionServiceImpl;
	
	@GetMapping("/users-profile")
	public String userProfile(Model m, @RequestParam(defaultValue = "0") int userNum, HttpSession ses) { 
//		if (userNum == 0) {
//			return "redirect:/";
//		}
		ses.setAttribute("userNum", userNum);
		log.info("userNum:"+userNum);
		UserVO user=this.auctionServiceImpl.findUserByuserNum(userNum);
		
		m.addAttribute("user",user);
		return "users-profile";
	}
	
//	@PostMapping(value="/users-profile/payments/complete", produces = "application/json")
//	public String requestPayment () {
//		return "users-profile";
//	}

}
