package three.team.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	
	//채팅창 여는 메서드
	@GetMapping("/chat")
	public String chatOpen() {
		return "chat/chat";
	}
}
