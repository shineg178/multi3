package three.team.project;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;
import three.user.model.UserVO;
import three.user.service.UserService;

@Controller
@Log4j
public class UserController {
	
	@Autowired
	private UserService userservice;
	
	//회원가입 페이지 이동
	@GetMapping("join")
	public String joinGET() {
		
		log.info("회원가입 페이지 진입");
		
		return "user/join";
	}
	
		
		@PostMapping("/joinUser")
		public String joinUser(@ModelAttribute UserVO vo) {
			log.info(vo);
			int n= userservice.joinUser(vo);
			return "index";
		}
	
	//로그인 페이지 이동
	@GetMapping("login")
	public String loginGET() {
		
		log.info("로그인 페이지 진입");
		
		return "user/login";
	}
	
}