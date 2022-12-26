package three.team.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

//공지사항 컨트롤러
@Controller
public class NoticeController {
	
	//공지사항 리스트 이동 메서드
	@GetMapping("/noticeList")
	public String noticeList() {
		
		return "notice/noticelist";
	}
	
	//공지사항 글 추가 폼 이동 메서드
	@GetMapping("/addNoticeForm")
	public String addNoticeForm() {
		return "notice/noticeForm";
	}
	
	//공지사항 수정 폼 이동 메서드
	@GetMapping("/editNoticeForm")
	public String editNoticeForm() {
		return "notice/noticeForm";
	}
}
