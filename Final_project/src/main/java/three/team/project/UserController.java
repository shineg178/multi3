package three.team.project;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import three.user.model.UserVO;
import three.user.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userservice;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void joinGET() {
		
		logger.info("회원가입 페이지 진입");
				
	}
	
	//회원가입
		@RequestMapping(value="/join", method=RequestMethod.POST)
		public String joinPOST(UserVO user) throws Exception{
			
			logger.info("join 진입");
			
			// 회원가입 서비스 실행
			userservice.userJoin(user);
			
			logger.info("join Service 성공");
			
			return "redirect:/index";
			
		}
		
	
	//로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET() {
		
		logger.info("로그인 페이지 진입");
		
	}
	
}