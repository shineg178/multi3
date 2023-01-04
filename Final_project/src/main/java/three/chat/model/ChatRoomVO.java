package three.chat.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoomVO {
	private int roomid;//채팅방 번호
	private int userNum1;//유저1 
	private int userNum2;//유저2
}
