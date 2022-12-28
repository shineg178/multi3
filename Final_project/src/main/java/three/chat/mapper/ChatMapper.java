package three.chat.mapper;

import java.util.List;

import three.chat.model.ChatAlertVO;
import three.chat.model.ChatRoomVO;
import three.chat.model.ChatVO;

public interface ChatMapper {
	//방생성 메서드
	int createRoom(ChatRoomVO vo);
	
	//방 존재 여부 확인 메서드
	ChatRoomVO findRoomCheck(ChatRoomVO vo);
	
	//자신의 채팅방 목록 불러오는 메서드
	List<ChatRoomVO> myChatRoomList(ChatRoomVO vo); 
	
	//채팅방 나가기 메서드
	int exitChat(ChatRoomVO vo);
	
	//특정 방 정보 가져오는 메서드
	ChatRoomVO selectRoom(int roomid);

	//보낸 메시지 저장 메서드
	int insertMessage(ChatVO vo);
	
	//지난 채팅 내용 리스트로 불러오는 메서드
	List<ChatVO> findChatList(int roomid);
	
	//안읽은 메시지 추가
	int addNoReadCount(ChatAlertVO vo);
	
	//안읽은 메시지 가져오기
	int myNoRead(int usernum);
	
	//읽지않은 메시지 내역 삭제
	int deleteNoRead(ChatAlertVO vo);
}
