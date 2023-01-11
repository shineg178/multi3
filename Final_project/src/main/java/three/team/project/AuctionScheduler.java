package three.team.project;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;
import three.auction.model.AuctionEndVO;
import three.auction.model.AuctionVO;
import three.auction.service.AuctionService;
import three.product.model.ProductVO;

@Log4j
@Component
public class AuctionScheduler {
	
	@Inject
	private AuctionService auctionServiceImpl;
	
	@Scheduled(cron = "0 * * * * *")
	public void auctionEnd() {
		log.info("스케줄");
	
		List<ProductVO> pList=auctionServiceImpl.findProductbiding();
		Date nowTime=new Date();
		int n=0;
		for(ProductVO pvo : pList) {
			//종료시간 구하기
			Calendar closeCal=Calendar.getInstance();
			closeCal.setTime(pvo.getPIndate());
			closeCal.add(Calendar.DATE, pvo.getAuctionTime());
			Date closeTime=closeCal.getTime();
			if(closeTime.getTime() - nowTime.getTime() <= 0) {
				n=pvo.getProdNum();
				if(n != 0) {
					ProductVO vo=auctionServiceImpl.findProductByProdNum(n);
					AuctionVO avo=auctionServiceImpl.selectMaxAuctionByProdNum(n);
					int prodNum=vo.getProdNum();
					String prodName=vo.getProdName();
					String sellId=vo.getUserId();
					String buyId=avo.getUserId();
					int endPrice=avo.getAucPrice();
					
					AuctionEndVO endVO=new AuctionEndVO(0,prodNum,prodName,buyId,sellId,null,endPrice,0);
					int v=auctionServiceImpl.findAuctionEnd(endVO);
					log.info("v==="+v);
					if(v==1) {
						int u=auctionServiceImpl.chageProductStatus(prodNum);
						int a=auctionServiceImpl.insertAuctionEnd(endVO);
						int minusPoint=auctionServiceImpl.minusPointByAuction(endVO	);
						log.info("완료"+nowTime);
					}
				}
			}
		}
	}
}
