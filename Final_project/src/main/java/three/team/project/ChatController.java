package three.team.project;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import three.chat.model.ChatAlertVO;
import three.chat.model.ChatRoomVO;
import three.chat.model.ChatVO;
import three.chat.service.ChatService;
import three.user.model.UserVO;

@Controller
@Log4j
public class ChatController {
	
	@Inject
	private ChatService chatServiceImpl;	
	
	//채팅창 여는 메서드
	@GetMapping("/chat")
	public String chatOpen(@RequestParam int roomid,Model m,HttpSession ses) {
		UserVO uvo=(UserVO)ses.getAttribute("user");
		String userid=uvo.getUserId();
		
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
	
	//채팅방 만들기
	@GetMapping("/addChatRoom")
	public String addChatRoom(@RequestParam String sellerId,@RequestParam int prodNum,HttpSession ses) {
		//내 아이디 정보 가져오기
		UserVO vo=(UserVO)ses.getAttribute("user");
		String myid=vo.getUserId();
		

		//상대방 아이디 정보 가져오기

		
		ChatRoomVO roomvo=new ChatRoomVO(0,myid,sellerId);
		//방생성
		chatServiceImpl.createRoom(roomvo);
		
		return "redirect:auction/auctionDetail?prodNum="+prodNum;
	}
	
	@GetMapping("/createChatRoom")
	public String createChatRoom(@RequestParam String toId,HttpSession ses) {
		UserVO vo=(UserVO)ses.getAttribute("user");
		String myId=vo.getUserId();
		ChatRoomVO roomvo=new ChatRoomVO(0,myId,toId);
		
		chatServiceImpl.createRoom(roomvo);
		
		return "redirect:/users-profile";
	}
	
	//내 채팅방 목록 가져오기
	@GetMapping(value="/openChatList",produces="application/json")
	@ResponseBody
	public List<ChatRoomVO> myChatList(HttpSession ses){
		ChatRoomVO vo=new ChatRoomVO();
		UserVO uvo=(UserVO)ses.getAttribute("user");

		if(uvo!=null) {
			vo.setUserId1(uvo.getUserId());
		}
		log.info(vo);
		
		List<ChatRoomVO> list = chatServiceImpl.myChatRoom(vo);
		log.info(list);
		return list;
	}
	
	//채팅방 나가기
	@PostMapping(value="/deleteChat",produces="application/json")
	@ResponseBody
	public int ExitChat(@RequestParam int rid,HttpSession ses) {
		//방에 있는 이미지 이름 목록 가져오기
		List<String> imgList=chatServiceImpl.exitRoomImg(rid);
		
		ServletContext app=ses.getServletContext();
		String upDir=app.getRealPath("/resources/Chat_Image");
		
		for(String fname:imgList) {
			if(fname!=null) {
				File delf=new File(upDir,fname);
				if(delf.exists()) {
					delf.delete();
				}
			}
		}
		
		return chatServiceImpl.exitChat(new ChatRoomVO(rid,null,null));
	}
	
	//안읽은 메시지 가져오기
	@GetMapping(value="/AllnoRead",produces="application/json")
	@ResponseBody
	public int AllnoRead(HttpSession ses) {
		UserVO uvo=(UserVO)ses.getAttribute("user");
		if(uvo!=null) {
			String userid=uvo.getUserId();
			int n=chatServiceImpl.myNoRead(userid);
			return n;
		}
		return 0;
	}
	
	//이미지 전송시 이미지 저장
	@PostMapping("sendImg")
	@ResponseBody
	public int sendImg(@RequestParam MultipartFile img,HttpSession ses,@ModelAttribute ChatVO vo) {
		
		UserVO uvo=(UserVO)ses.getAttribute("user");
		String user=uvo.getUserId();
		
		
		vo.setSUser(user);
		
		ServletContext app=ses.getServletContext();
		String upDir=app.getRealPath("/resources/Chat_Image");
		
		//파일 경로가 존재하지 않을 경우 만듦
		File dir=new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String originFname=img.getOriginalFilename();
		UUID uuid=UUID.randomUUID();
		String filename=uuid.toString()+"_"+originFname;
		
		vo.setCImg(filename);
		vo.setSendMsg(originFname);
		int n=chatServiceImpl.sendImg(vo);
		
		//파일 업로드
		try {
			img.transferTo(new File(upDir,filename));
		}catch(Exception e) {
			log.error(e);
		}
		return n;

	}
	
	@GetMapping(value="/myNoread",produces="application/json")
	@ResponseBody
	public List<ChatAlertVO> myNoread(HttpSession ses){
		UserVO uvo=(UserVO)ses.getAttribute("user");
		String userId=uvo.getUserId();

		
		List<ChatAlertVO> list=chatServiceImpl.myNoread(userId);
		log.info(list);
		return list;
	}
	
	
	//테스트 끝-----------------------------------
}
