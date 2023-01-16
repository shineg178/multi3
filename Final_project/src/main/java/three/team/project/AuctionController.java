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
import three.chat.model.ChatAlertVO;
import three.chat.model.ChatRoomVO;
import three.chat.model.ChatVO;
import three.chat.service.ChatService;
import three.product.model.ProductVO;
import three.profile.service.ProfileService;
import three.user.model.UserVO;

@Controller
@Log4j
public class AuctionController extends Thread{

	@Inject
	private AuctionService auctionServiceImpl;
	
	@Inject 
	private ChatService chatServiceImpl;
	
	@Inject
	private ProfileService profileServiceImpl;

	//경매 상세페이지의 물건정보 가져오기

	@GetMapping("/auction/auctionDetail")
	public String auctionDetail(Model m, @RequestParam("prodNum") int prodNum, 
			HttpSession ses) {

		if (prodNum == 0) {
			return "redirect:/";
		}
		if(ses.getAttribute("user")==null) {
			return "redirect:/";
		}
		if (ses.getAttribute("user") == null) {
			return "redirect:index";
		}
		ses.setAttribute("prodNum", prodNum);

		UserVO loginUser=(UserVO)ses.getAttribute("user");
		log.info("prodNum: "+prodNum);
	
		
		//경매 웹소켓 userid
		ses.setAttribute("userId", loginUser.getUserId());
		m.addAttribute("userId",loginUser.getUserId());
		
		//채팅 웹소켓 id
		ses.setAttribute("id", loginUser.getUserId());
		m.addAttribute("id",loginUser.getUserId());
		
		//물품 정보 가져오기
		ProductVO prod = this.auctionServiceImpl.selectProductByProdNum(prodNum);
		m.addAttribute("prod", prod);
		
		//판매자 정보 가져오기
		String sellerId=prod.getUserId();
		UserVO user=this.auctionServiceImpl.findUserByUserId(sellerId);
		double avrScore=this.profileServiceImpl.getAverage(sellerId);
		ses.setAttribute("seller", user);
		m.addAttribute("average",avrScore);
		m.addAttribute("seller",user);
		
		//물품현재가 정보 가져오기
		AuctionVO avo=this.auctionServiceImpl.selectMaxAuctionByProdNum(prodNum);
		log.info(avo.getAucPrice());
		m.addAttribute("auction",avo);
		
		//종료시간 구하기
		Calendar cal=Calendar.getInstance();
		cal.setTime(prod.getPIndate());
		cal.add(Calendar.DATE, prod.getAuctionTime());
		Date closeTime=cal.getTime();
		Date nowTime=new Date();
		m.addAttribute("closeTime",closeTime);
		m.addAttribute("nowTime",nowTime);
		
		UserVO uvo=this.auctionServiceImpl.findUserByUserId(loginUser.getUserId());
		m.addAttribute("user",uvo);
		ses.setAttribute("user", uvo);
		
		return "auction/auctionDetail";
	}

	@PostMapping("/auction/auctionDetail/bid")
	@ResponseBody

	public Map<String, Object> auctionBid(@RequestBody Map<String, Object> map, HttpSession ses,
			Model m){
		int prodNum=Integer.parseInt(map.get("prodNum").toString());
		String userId=map.get("userId").toString();
		int aucPrice=Integer.parseInt(map.get("aucPrice").toString());
		
		ProductVO pvo=this.auctionServiceImpl.findProductByProdNum(prodNum);
		AuctionVO maxvo=this.auctionServiceImpl.selectMaxAuctionByProdNum(prodNum);
		
		if(aucPrice <= maxvo.getAucPrice()) {
			m.addAttribute("auction", maxvo);
			return null;
		}else if(aucPrice > maxvo.getAucPrice()){
			if(maxvo.getAucPrice() != pvo.getAucStartPrice()) {
				this.auctionServiceImpl.plusPointByAuction(maxvo);
				
				ChatRoomVO bidChatRoom=new ChatRoomVO(0,"경매관리자",maxvo.getUserId());
				this.chatServiceImpl.createRoom(bidChatRoom);
				int bidRoomId=chatServiceImpl.findChatRoomIdById(bidChatRoom);
				ChatVO sellChat=new ChatVO(bidRoomId,"경매관리자",maxvo.getUserId(),pvo.getProdName()+" 물품경매에 더 높은 입찰이 들어왔습니다.",null,null);
				chatServiceImpl.insertMessage(sellChat);
				sellChat.setSendMsg("이전 입찰금액 : "+maxvo.getAucPrice()+"포인트가 반환되었습니다");
				chatServiceImpl.insertMessage(sellChat);
				ChatAlertVO bidAlert=new ChatAlertVO(bidRoomId,maxvo.getUserId(),1);
				chatServiceImpl.addNoReadCount(bidAlert);
			}
			AuctionVO vo=new AuctionVO(0,prodNum,userId,aucPrice,null);
			this.auctionServiceImpl.minusPointByAuction(vo);
			int n=this.auctionServiceImpl.insertAuction(vo);
			UserVO user=this.auctionServiceImpl.findUserByUserId(userId);
			ses.setAttribute("user", user);
			m.addAttribute("user",user);
			m.addAttribute("auction",vo);
		}
		
		return map;
	}
}
