package three.chat.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoomVO {
	private int roomid;//채팅방 번호
	private String userId1;//유저1 
	private String userId2;//유저2
}
