package three.team.project;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;
import three.chat.model.ChatAlertVO;
import three.chat.model.ChatRoomVO;
import three.chat.model.ChatVO;
import three.chat.service.ChatService;

@Controller
@Log4j
public class ChatController {
	
	@Inject
	private ChatService chatServiceImpl;	
	
	//채팅창 여는 메서드
	@GetMapping("/chat")
	public String chatOpen(@RequestParam int roomid,Model m,HttpSession ses) {
		int userid=(int)ses.getAttribute("id");
		
		//해당 방 정보 가져오기
		ChatRoomVO roomvo=chatServiceImpl.selectRoom(roomid);

		//접속시 읽지않은 메시지내역에서 삭제하기
		chatServiceImpl.deleteNoRead(new ChatAlertVO(roomid,userid,0));
				
		//지난 채팅 내역 불러오기
		List<ChatVO> clist=chatServiceImpl.findChatList(roomid);
		log.info(clist);
		
		m.addAttribute("cList",clist);
		m.addAttribute("Room",roomvo);
		return "chat/chat";
	}

	//채팅창 테스트 --------------------------
	@GetMapping("/1")
	public String a(HttpSession ses) {
		ses.setAttribute("id", 1);
		return "index";
	}
	
	@GetMapping("/2")
	public String b(HttpSession ses) {
		ses.setAttribute("id", 2);
		return "index";
	}
	
	@GetMapping("/3")
	public String c(HttpSession ses) {
		ses.setAttribute("id", 3);
		return "index";
	}
	
	@GetMapping("/room1")
	public String room1(HttpSession ses) {
		int myNick = (int) ses.getAttribute("id");
		ChatRoomVO vo=new ChatRoomVO(0,myNick,1);

		chatServiceImpl.createRoom(vo);
	
		return "index";
	}
	
	@GetMapping("/room2")
	public String room2(HttpSession ses) {
		int myNick = (int) ses.getAttribute("id");
		ChatRoomVO vo=new ChatRoomVO(0,myNick,2);
		
		chatServiceImpl.createRoom(vo);

		return "index";
	}
	
	@GetMapping("/room3")
	public String room3(HttpSession ses) {
		int myNick = (int) ses.getAttribute("id");
		ChatRoomVO vo=new ChatRoomVO(0,myNick,3);
		
		chatServiceImpl.createRoom(vo);
			
		return "index";
	}
	
	@GetMapping(value="/openChatList",produces="application/json")
	@ResponseBody
	public List<ChatRoomVO> myChatList(HttpSession ses){
		ChatRoomVO vo=new ChatRoomVO();
		vo.setUserNum1((int)ses.getAttribute("id"));
		List<ChatRoomVO> list = chatServiceImpl.myChatRoom(vo);
		log.info(list);
		return list;
	}
	
	@PostMapping(value="/deleteChat",produces="application/json")
	@ResponseBody
	public int ExitChat(@RequestParam int rid) {
		return chatServiceImpl.exitChat(new ChatRoomVO(rid,0,0));
	}
	
	
	@GetMapping(value="/AllnoRead",produces="application/json")
	@ResponseBody
	public int AllnoRead(HttpSession ses) {
		int n=chatServiceImpl.myNoRead((int)ses.getAttribute("id"));
		return n;
	}
	
	
	//테스트 끝-----------------------------------
}
