package three.team.project;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;
import three.auction.service.AuctionService;
import three.product.model.ProductVO;
import three.user.model.UserVO;

@Controller
@Log4j
public class AuctionController {

	@Inject
	private AuctionService auctionServiceImpl;

	@GetMapping("/auction")
	public String auctionDetail() {

		return "auction/auctionDetail";
	}

	public String a(HttpSession ses) {
		ses.setAttribute("id", "id");
		return "auction/auctionDetail";
	}
	
	//경매 상세페이지의 물건정보 가져오기
	@GetMapping("/auctionDetail")
	public String productByProdNum(Model m, @RequestParam(defaultValue = "0") int prodNum, HttpSession ses) {
		if (prodNum == 0) {
			return "redirect:index";
		}
		ses.setAttribute("prodNum", prodNum);
		log.info("prodNum: "+prodNum);
		ProductVO prod = this.auctionServiceImpl.selectProductByProdNum(prodNum);
		
		int userNum=prod.getUserNum_fk();
		UserVO user=this.auctionServiceImpl.findUserByuserNum(userNum);
		
		m.addAttribute("prod", prod);
		m.addAttribute("user",user);
		return "auction/auctionDetail";
	}

}
