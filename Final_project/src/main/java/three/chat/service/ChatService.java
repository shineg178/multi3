package three.chat.service;

import java.util.List;

import three.chat.model.ChatRoomVO;

public interface ChatService {
	//방생성 메서드
	int createRoom(ChatRoomVO vo);
	
	//방 존재 여부 확인 메서드
	ChatRoomVO findRoomCheck(ChatRoomVO vo);
	
	//자신의 채팅방 목록 불러오는 메서드
	List<ChatRoomVO> myChatRoom(ChatRoomVO vo); 
	
	//채팅방 나가기 메서드
	int exitChat(ChatRoomVO vo);
}
