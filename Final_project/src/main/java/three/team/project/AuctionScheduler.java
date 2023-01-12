package three.team.project;

import java.text.SimpleDateFormat;
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
import three.chat.model.ChatAlertVO;
import three.chat.model.ChatRoomVO;
import three.chat.model.ChatVO;
import three.chat.service.ChatService;
import three.product.model.ProductVO;

@Log4j
@Component
public class AuctionScheduler {
	
	@Inject
	private AuctionService auctionServiceImpl;
	
	@Inject
	private ChatService chatServiceImpl;	
	
	@Scheduled(cron = "0 * * * * *")
	public void auctionEnd() {
		//log.info("마감한 경매 검사 중");
		List<ProductVO> pList=auctionServiceImpl.findProductbiding();
		Date nowTime=new Date();
		int endProdNum=0;
		for(ProductVO pvo : pList) {
			//종료시간 구하기
			Calendar closeCal=Calendar.getInstance();
			closeCal.setTime(pvo.getPIndate());
			closeCal.add(Calendar.DATE, pvo.getAuctionTime());
			Date closeTime=closeCal.getTime();
			if(closeTime.getTime() - nowTime.getTime() <= 0) {
				endProdNum=pvo.getProdNum();
				if(endProdNum != 0) {
					log.info("마감처리중");
					ProductVO vo=auctionServiceImpl.findProductByProdNum(endProdNum);
					AuctionVO avo=auctionServiceImpl.selectMaxAuctionByProdNum(endProdNum);
					int prodNum=vo.getProdNum();
					String prodName=vo.getProdName();
					String sellId=vo.getUserId();
					String buyId=avo.getUserId();
					int endPrice=avo.getAucPrice();
					
					AuctionEndVO endVO=new AuctionEndVO(0,prodNum,prodName,buyId,sellId,null,endPrice,0);
					int v=auctionServiceImpl.findAuctionEnd(endVO);
					log.info("v==="+v);
					if(v==1) {
						
						if(sellId.equals(buyId)) {
							endVO.setAucStatus(1);
							int a=auctionServiceImpl.insertAuctionEnd(endVO);
							int u=auctionServiceImpl.chageProductStatus(prodNum);
							ChatRoomVO sellChatRoom=new ChatRoomVO(0,"admin",sellId);
							int sellRoom=chatServiceImpl.createRoom(sellChatRoom);
							int sellRoomId=chatServiceImpl.findChatRoomIdById(sellChatRoom);
							ChatVO sellChat=new ChatVO(sellRoomId,"admin",sellId,prodName+" 물품의 경매가 마감되었습니다.",null,null);
							chatServiceImpl.insertMessage(sellChat);
							sellChat.setSendMsg("입찰자가 아무도 없습니다.");
							chatServiceImpl.insertMessage(sellChat);
							ChatAlertVO sellAlert=new ChatAlertVO(sellRoomId,sellId,2);
							chatServiceImpl.addNoReadCount(sellAlert);
							log.info(sellId+"에게 알림");
						}else {
							int u=auctionServiceImpl.chageProductStatus(prodNum);
							int a=auctionServiceImpl.insertAuctionEnd(endVO);
							int minusPoint=auctionServiceImpl.minusPointByAuction(endVO	);
							SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
							String time=formatter.format(new Date());
							log.info("마감 완료"+time);
							
							//구매자한테 채팅으로 알림
							ChatRoomVO buyChatRoom=new ChatRoomVO(0,"admin",buyId);
							int buyRoom=chatServiceImpl.createRoom(buyChatRoom);
							int buyRoomId=chatServiceImpl.findChatRoomIdById(buyChatRoom);
							ChatVO buyChat=new ChatVO(buyRoomId,"admin",buyId,prodName+" 물품에 낙찰되었습니다.",null,null);
							chatServiceImpl.insertMessage(buyChat);
							buyChat.setSendMsg("마이페이지에서 확인해주세요");
							chatServiceImpl.insertMessage(buyChat);
							ChatAlertVO buyAlert=new ChatAlertVO(buyRoomId,buyId,2);
							chatServiceImpl.addNoReadCount(buyAlert);
							log.info(buyId+"에게 알림");
							
							//판매자한테 채팅으로 알림
							ChatRoomVO sellChatRoom=new ChatRoomVO(0,"admin",sellId);
							int sellRoom=chatServiceImpl.createRoom(sellChatRoom);
							int sellRoomId=chatServiceImpl.findChatRoomIdById(sellChatRoom);
							ChatVO sellChat=new ChatVO(sellRoomId,"admin",sellId,prodName+" 물품의 경매가 마감되었습니다.",null,null);
							chatServiceImpl.insertMessage(sellChat);
							sellChat.setSendMsg("마이페이지에서 확인해주세요");
							chatServiceImpl.insertMessage(sellChat);
							ChatAlertVO sellAlert=new ChatAlertVO(sellRoomId,sellId,2);
							chatServiceImpl.addNoReadCount(sellAlert);
							log.info(sellId+"에게 알림");
						}
						
					}
				}
			}
		}
	}
}
