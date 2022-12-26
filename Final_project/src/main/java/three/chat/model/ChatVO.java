package three.chat.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatVO {
	private int roomid;
	private int sendUnum;
	private int receiveUnum;
	private String sendMsg;
	private Date chatTime;
}
