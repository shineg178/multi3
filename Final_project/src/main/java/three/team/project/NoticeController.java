package three.team.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	@GetMapping("/noticeList")
	public String noticeList() {
		
		return "notice/noticelist";
	}
}
