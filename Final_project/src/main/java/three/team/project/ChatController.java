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
import three.chat.model.ChatRoomVO;
import three.chat.service.ChatService;

@Controller
@Log4j
public class ChatController {
	
	@Inject
	private ChatService chatServiceImpl;	
	
	//채팅창 여는 메서드
	@GetMapping("/chat")
	public String chatOpen(@RequestParam int roomid,Model m) {
		log.info(roomid);
		m.addAttribute("roomid",roomid);
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
		int myid = (int) ses.getAttribute("id");
		ChatRoomVO vo=new ChatRoomVO(0,myid,1);
		ChatRoomVO a=chatServiceImpl.findRoomCheck(vo);
		if(a==null) {
			chatServiceImpl.createRoom(vo);
		}
		
		
		return "index";
	}
	
	@GetMapping("/room2")
	public String room2(HttpSession ses) {
		int myid = (int) ses.getAttribute("id");
		ChatRoomVO vo=new ChatRoomVO(0,myid,2);
		ChatRoomVO a=chatServiceImpl.findRoomCheck(vo);
		if(a==null) {
			chatServiceImpl.createRoom(vo);
		}
		
		
		return "index";
	}
	
	@GetMapping("/room3")
	public String room3(HttpSession ses) {
		int myid = (int) ses.getAttribute("id");
		ChatRoomVO vo=new ChatRoomVO(0,myid,3);
		ChatRoomVO a=chatServiceImpl.findRoomCheck(vo);
		if(a==null) {
			chatServiceImpl.createRoom(vo);
		}
			
		return "index";
	}
	
	@GetMapping(value="/openChatList",produces="application/json")
	@ResponseBody
	public List<ChatRoomVO> myChatList(HttpSession ses){
		ChatRoomVO vo=new ChatRoomVO();
		vo.setUserNum1((int)ses.getAttribute("id"));
		List<ChatRoomVO> list = chatServiceImpl.myChatRoom(vo);
		return list;
	}
	
	@PostMapping(value="/deleteChat",produces="application/json")
	@ResponseBody
	public int ExitChat(@RequestParam int rid) {
		return chatServiceImpl.exitChat(new ChatRoomVO(rid,0,0));
	}
	
	
	//테스트 끝-----------------------------------
}
