package three.team.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;
import three.chat.service.ChatService;

@Controller
@Log4j
public class ChatHandler extends TextWebSocketHandler {
	
	private Map<String,ArrayList<WebSocketSession>> roomList=new HashMap<String,ArrayList<WebSocketSession>>();
	
	private  Map<WebSocketSession, String> sessionList = new HashMap<WebSocketSession, String>();
	
	@Autowired
	private ChatService chatServiceImpl;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

	}
	
	 //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	log.info(message.getPayload());
    	
    	//전달 받은 메시지 
    	String msg=message.getPayload();
    	
    	//전달 받은 메시지 3번째 ex > ( : :X)
    	String[] enter=msg.split(":");
    	String roomid=enter[0];
    	
    	//메시지 전송이 아니라 방에 입장했을때
    	if(enter[2].equals("Enter")) {
    		//이미 생성된 방이라면
    		if(roomList.get(roomid)!=null) {
    			roomList.get(roomid).add(session);
    			sessionList.put(session, roomid);
    			log.info(roomList);
    		//아직 생성되지 않은 방이라면
    		}else if(roomList.get(roomid) == null) {
    			ArrayList<WebSocketSession> userList=new ArrayList<>();
    			userList.add(session);
    			roomList.put(roomid,userList);
    			sessionList.put(session, roomid);
    			log.info(roomList);
    		}
    		
    	//방 입장이 아니라 메시지 전송일 경우
    	}else {
    		TextMessage textMessage = new TextMessage(enter[1]+" : "+enter[2]);
    		
	    	for(WebSocketSession ses:roomList.get(roomid)) {
	    		ses.sendMessage(textMessage);
	    	}
    	}
    	
    }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	roomList.get(sessionList.get(session)).remove(session);
    }
}
