package three.team.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AuctionController	 {
	
	@GetMapping("/auctionDetail")
	public String chatOpen() {
		return "auction/auctionDetail";
	}
	
}
