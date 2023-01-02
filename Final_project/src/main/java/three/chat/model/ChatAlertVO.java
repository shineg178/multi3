package three.chat.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatAlertVO {
	private int roomid;
	private int usernum;
	private int noReadCount;//읽지 않은 메시지 수 
}