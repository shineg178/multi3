package three.chat.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatVO {
	private int roomid;//채팅방번호
	private String sNum;//보낸이
	private String rNum;//받는이
	private String sendMsg;//메시지 내용
	private Date chatTime;//메시지 전송 시간
}
