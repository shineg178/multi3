package three.team.project;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Timer;
import java.util.TimerTask;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;
import three.auction.model.AuctionEndVO;
import three.auction.model.AuctionVO;
import three.auction.service.AuctionService;
import three.product.model.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private AuctionService auctionServiceImpl;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
//		List<ProductVO> pList=auctionServiceImpl.findAllProductList();
//		Date nowTime=new Date();
//		int n = 0;
//		for(ProductVO pvo : pList) {
//			//종료시간 구하기
//			Calendar closeCal=Calendar.getInstance();
//			closeCal.setTime(pvo.getPIndate());
//			closeCal.add(Calendar.DATE, pvo.getAuctionTime());
//			Date closeTime=closeCal.getTime();
//			if(closeTime==nowTime) {
//				n=pvo.getProdNum();
//			}
//		}
//		if(n != 0) {
//			ProductVO vo=auctionServiceImpl.findProductByProdNum(n);
//			AuctionVO avo=auctionServiceImpl.selectMaxAuctionByProdNum(n);
//			Timer scheduler = new Timer();
//			TimerTask task = new TimerTask() {
//				@Override
//				public void run() {
//					int prodNum=vo.getProdNum();
//					String prodName=vo.getProdName();
//					String sellId=vo.getUserId();
//					String buyId=avo.getUserId();
//					int endPrice=avo.getAucPrice();
//					
//					AuctionEndVO endVO=new AuctionEndVO(0,prodNum,prodName,buyId,sellId,null,endPrice,0);
//					int a=auctionServiceImpl.insertAuctionEnd(endVO);
//				}
//			};
//			scheduler.schedule(task, 100000);
//		}
		
		return "index";
	}
	
	@RequestMapping("/top")
	public String top() {
		return "top";
	}
	
	@RequestMapping("/foot")
	public String foot() {
		return "foot";
	}
	
}

