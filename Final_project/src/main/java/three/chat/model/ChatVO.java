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
	private String sUser;//보낸이
	private String rUser;//받는이
	private String sendMsg;//메시지 내용
	private String cImg;
	private Date chatTime;//메시지 전송 시간
}
