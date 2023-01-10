package three.team.project;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;
import three.auction.model.AuctionVO;
import three.auction.service.AuctionService;
import three.product.model.ProductVO;
import three.user.model.UserVO;

@Controller
@Log4j
public class AuctionController {

	@Inject
	private AuctionService auctionServiceImpl;

	// 경매 상세페이지의 물건정보 가져오기
	@GetMapping("/auction/auctionDetail")
	public String auctionDetail(Model m, @RequestParam("prodNum") int prodNum, HttpSession ses) {
		if (prodNum == 0) {
			return "redirect:index";
		}
		if (ses.getAttribute("user") == null) {
			return "redirect:index";
		}
		ses.setAttribute("prodNum", prodNum);
		log.info("prodNum: " + prodNum);
		UserVO loginUser = (UserVO) ses.getAttribute("user");
		m.addAttribute("loginUser", loginUser);
		ses.setAttribute("user", loginUser);
		ses.setAttribute("userId", loginUser.getUserId());

		// 물품 정보 가져오기
		ProductVO prod = this.auctionServiceImpl.selectProductByProdNum(prodNum);
		m.addAttribute("prod", prod);

		// 판매자 정보 가져오기
		int sellerNum = prod.getUserNum_fk();
		UserVO user = this.auctionServiceImpl.findUserByuserNum(sellerNum);
		m.addAttribute("seller", user);

		// 물품현재가 정보 가져오기
		AuctionVO avo = this.auctionServiceImpl.selectMaxAuctionByProdNum(prodNum);
		m.addAttribute("auction", avo);

		// 종료시간 구하기
		Calendar cal = Calendar.getInstance();
		cal.setTime(prod.getPIndate());
		cal.add(Calendar.DATE, prod.getAuctionTime());
		Date closeTime = cal.getTime();
		Date nowTime = new Date();
		m.addAttribute("closeTime", closeTime);
		m.addAttribute("nowTime", nowTime);

		return "auction/auctionDetail";
	}

	@PostMapping("/auction/auctionDetail/bid")
	@ResponseBody
	public Map<String, Object> auctionBid(@RequestBody Map<String, Object> map, Model m) {
		int prodNum = Integer.parseInt(map.get("prodNum").toString());
		int userNum = Integer.parseInt(map.get("userNum").toString());
		int aucPrice = Integer.parseInt(map.get("aucPrice").toString());

		AuctionVO maxvo = this.auctionServiceImpl.selectMaxAuctionByProdNum(prodNum);

		if (aucPrice <= maxvo.getAucPrice()) {
			m.addAttribute("newBid", maxvo);
			return null;
		}

		AuctionVO vo = new AuctionVO(0, prodNum, userNum, aucPrice, null);
		int n = this.auctionServiceImpl.insertAuction(vo);
		m.addAttribute("newBid", vo);
		return map;
	}

}