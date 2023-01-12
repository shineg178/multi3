package three.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.chat.mapper.ChatMapper;
import three.chat.model.ChatAlertVO;
import three.chat.model.ChatRoomVO;
import three.chat.model.ChatVO;

@Service("chatServiceImpl")
public class ChatServcieImpl implements ChatService{
	
	@Autowired
	private ChatMapper chatMapper;

	//채팅방 생성메서드
	@Override
	public int createRoom(ChatRoomVO vo) {
		return chatMapper.createRoom(vo);
	}

	@Override
	public List<ChatRoomVO> myChatRoom(ChatRoomVO vo) {
		List<ChatRoomVO> list=chatMapper.myChatRoomList(vo);
		return list;
	}

	@Override
	public int exitChat(ChatRoomVO vo) {
		return chatMapper.exitChat(vo);
	}

	@Override
	public ChatRoomVO selectRoom(int roomid) {
		return chatMapper.selectRoom(roomid);
	}

	@Override
	public int insertMessage(ChatVO vo) {
		return chatMapper.insertMessage(vo);
	}

	@Override
	public List<ChatVO> findChatList(int roomid) {
		return chatMapper.findChatList(roomid);
	}

	@Override
	public int addNoReadCount(ChatAlertVO vo) {
		return chatMapper.addNoReadCount(vo);
	}

	@Override
	public int myNoRead(String userId) {
		return chatMapper.myNoRead(userId);
	}

	@Override
	public int deleteNoRead(ChatAlertVO vo) {
		return chatMapper.deleteNoRead(vo);
	}

	@Override
	public int sendImg(ChatVO vo) {
		return chatMapper.sendImg(vo);
	}

	@Override
	public String findImg(ChatVO vo) {
		return chatMapper.findImg(vo);
	}

	@Override
	public List<ChatAlertVO> myNoread(String userId) {
		return chatMapper.myNoread(userId);
	}

	@Override
	public List<String> exitRoomImg(int roomid) {
		return chatMapper.exitRoomImg(roomid);
	}

	@Override
	public String findUserIdByNum(int sellerNum) {
		return chatMapper.findUserIdByNum(sellerNum);
	}
	
	@Override
	public int findChatRoomIdById(ChatRoomVO crvo) {
		return chatMapper.findChatRoomIdById(crvo);
	}
	
	
	
}
