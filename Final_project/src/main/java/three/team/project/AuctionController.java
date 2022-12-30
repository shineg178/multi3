package three.team.project;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
		//log.info("prodNum: "+prodNum);
		
		//물품 정보 가져오기
		ProductVO prod = this.auctionServiceImpl.selectProductByProdNum(prodNum);
		m.addAttribute("prod", prod);
		
		//판매자 정보 가져오기
		int userNum=prod.getUserNum_fk();
		ses.setAttribute("userNum", userNum);
		UserVO user=this.auctionServiceImpl.findUserByuserNum(userNum);
		m.addAttribute("user",user);
		
		//종료시간 구하기
		Calendar cal=Calendar.getInstance();
		cal.setTime(prod.getPIndate());
		cal.add(Calendar.DATE, prod.getAuctionTime());
		Date closeTime=cal.getTime();
		m.addAttribute("closeTime",closeTime);
		
		return "auction/auctionDetail";
	}

}
