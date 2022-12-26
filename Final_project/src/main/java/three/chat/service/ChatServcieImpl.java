package three.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import three.chat.mapper.ChatMapper;
import three.chat.model.ChatRoomVO;

@Service("chatServiceImpl")
public class ChatServcieImpl implements ChatService{
	
	@Autowired
	private ChatMapper chatMapper;

	//채팅방 생성메서드
	@Override
	public int createRoom(ChatRoomVO vo) {
		return chatMapper.creatRoom(vo);
	}

	@Override
	public ChatRoomVO findRoomCheck(ChatRoomVO vo) {
		return chatMapper.findRoomCheck(vo);
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
	
	
	
}
