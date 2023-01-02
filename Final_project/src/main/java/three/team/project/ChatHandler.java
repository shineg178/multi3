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
import three.chat.model.ChatAlertVO;
import three.chat.model.ChatVO;
import three.chat.service.ChatService;

@Controller
@Log4j
public class ChatHandler extends TextWebSocketHandler {
	
	private Map<String,ArrayList<WebSocketSession>> roomList=new HashMap<String,ArrayList<WebSocketSession>>();
	
	private  Map<WebSocketSession, String> sessionList = new HashMap<WebSocketSession, String>();
	
	@Autowired
	ChatService chatServiceImpl;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

	}
	
	 //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
    	//전달 받은 메시지 
    	String msg=message.getPayload();
    	log.info(msg);
    	//전달 받은 메시지 > (방번호:보낸이:받는이:내용)
    	String[] enter=msg.split(":");
    	
    	String roomid=enter[0];//방번호
    	String sUser=enter[1];//보낸이
    	String rUser=enter[2];//받는이
    	String sendMsg=enter[3];//보낸 메시지
    	String type=enter[4];//메시지 타입
    	
    	//ChatVO 객체에 담기
    	
    	ChatVO chatvo=new ChatVO(Integer.parseInt(roomid),sUser,rUser,sendMsg,null,null);
    	log.info(chatvo);
    	
    	
    	//[1] 메시지 전송이 아니라 방에 입장했을때
    	if(type.equals("Enter")) {
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
    		
    	//[2] 방 입장이 아니라 메시지 전송일 경우
    	}else if(type.equals("msg")){
    		//ChatAlertVO 객체에 담기
        	ChatAlertVO alertvo= new ChatAlertVO(Integer.parseInt(roomid),Integer.parseInt(rUser),0);
    		
        	//DB에 메시지 내용 저장
    		chatServiceImpl.insertMessage(chatvo);
    		log.info(alertvo);
    		
    		//채팅방에 혼자 있을경우
    		if(roomList.get(sessionList.get(session)).size()==1) {
	    		//DB에 읽지 않은 메시지 추가
	    		chatServiceImpl.addNoReadCount(alertvo);
    		}
    		
    		
    		//메시지 형태로 전환
    		TextMessage textMessage = new TextMessage(sUser+":"+sendMsg+":msg");
    		
    		//접속한 유저에게 메시지 출력
	    	for(WebSocketSession ses:roomList.get(roomid)) {
	    		ses.sendMessage(textMessage);
	    	}
	    	
	    //[3] 이미지 전송일 경우
    	}else if(type.equals("img")) {
    		//ChatAlertVO 객체에 담기
        	ChatAlertVO alertvo= new ChatAlertVO(Integer.parseInt(roomid),Integer.parseInt(rUser),0);
        	
        	//채팅방에 혼자 있을경우
    		if(roomList.get(sessionList.get(session)).size()==1) {
	    		//DB에 읽지 않은 메시지 추가
	    		chatServiceImpl.addNoReadCount(alertvo);
    		}
    		
    		TextMessage textMessage = new TextMessage(sUser+"::img");
    		//접속한 유저에게 메시지 출력
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
