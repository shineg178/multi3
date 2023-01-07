package three.team.project;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class AuctionHandler extends TextWebSocketHandler{
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	// 클라이언트가 서버로 연결시
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			sessions.add(session); //세션리스트에 저장
			String senderId = getUserId(session); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
			if(senderId!=null) {	// 로그인 값이 있는 경우만
				log(senderId + " 연결 됨");
				users.put(senderId, session);   // 로그인중 개별유저 저장
			}
		}
		// 클라이언트가 Data 전송 시
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			String senderId = getUserId(session);
			String msg = message.getPayload();
			log.info(msg);
			if(msg != null) {
				String[] strs = msg.split(",");
				log(strs.toString());
				String prodName = strs[0];
				String aucPrice = strs[1];
				TextMessage tmpMsg = new TextMessage(prodName+":"+aucPrice);
				for(WebSocketSession target: sessions) {
					target.sendMessage(tmpMsg);
				}
			}
		}
		// 연결 해제될 때
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			String senderId = getUserId(session);
			if(senderId!=null) {	// 로그인 값이 있는 경우만
				log(senderId + " 연결 종료됨");
				users.remove(senderId);
				sessions.remove(session);
			}
		}
		// 에러 발생시
		@Override
		public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
			log(session.getId() + " 익셉션 발생: " + exception.getMessage());

		}
		// 로그 메시지
		private void log(String logmsg) {
			System.out.println(new Date() + " : " + logmsg);
		}
		// 웹소켓에 id 가져오기
	    // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		private String getUserId(WebSocketSession session) {
			Map<String, Object> httpSession = session.getAttributes();
			String userId = (String) httpSession.get("userId"); // 세션에 저장된 m_id 기준 조회
			return userId==null? null: userId;
		}
}
