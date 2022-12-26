package three.chat.mapper;

import java.util.List;

import three.chat.model.ChatRoomVO;

public interface ChatMapper {
	int creatRoom(ChatRoomVO vo);
	ChatRoomVO findRoomCheck(ChatRoomVO vo); 
	List<ChatRoomVO> myChatRoomList(ChatRoomVO vo);
	int exitChat(ChatRoomVO vo);
}
