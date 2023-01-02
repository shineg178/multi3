package three.team.project;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class AuctionHandler extends TextWebSocketHandler {
	// message
	   @Override
	   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		   String userNum = (String) session.getAttributes().get("userNum");
		   String prodNum = (String) session.getAttributes().get("prodNum");
	   }

	   // connection established
	   @Override
	   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		   
	   }

	   // connection closed
	   @Override
	   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		   
	   }
	   
	   
}
