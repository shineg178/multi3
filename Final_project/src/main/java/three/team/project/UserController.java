package three.team.project;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;

import lombok.extern.log4j.Log4j;
import three.mail.service.MailService;
import three.social.login.GoogleLogin;
import three.social.login.KakaoLogin;
import three.social.login.NaverLogin;
import three.user.model.UserVO;
import three.user.service.UserService;

@Controller
@Log4j
public class UserController {

	@Autowired
	private UserService userservice;

	@Autowired
	private MailService mailService;

	// 회원가입 페이지 이동
	@GetMapping("join")
	public String joinGET() {
		return "user/join";
	}

	// 구글 로그인
	@GetMapping("/login/google/auth")
	public String googleLogin(Model m, @RequestParam String code, HttpSession ses) {
		log.info(code);

		JsonNode jsonToken = GoogleLogin.getAccessToken(code);
		String accessToken = jsonToken.get("access_token").toString();
		String refreshToken = "";
		if (jsonToken.has("refresh_token")) {
			refreshToken = jsonToken.get("refresh_token").toString();
		}

		String expiresTime = jsonToken.get("expires_in").toString();
		log.info(expiresTime);

		// Access Token으로 사용자 정보 반환
		JsonNode userInfo = GoogleLogin.getGoogleUserInfo(accessToken);

		String email = userInfo.get("email").asText();
		String Name = userInfo.get("name").asText();

		UserVO vo = new UserVO();
		vo.setUserId("(google)"+email);
		vo.setUserEmail(email);
		vo.setUserName(Name);
		UUID uid = UUID.randomUUID();
		String password = uid.toString();
		vo.setUserPassword(password);

		// 사용자 정보 출력
		log.info(vo);

		// 가입된 아이디인지 검색
		UserVO findUser = userservice.findSocialUser(vo);

		// 이미 가입된 아이디라면 세션에 추가
		if (findUser != null) {
			ses.setAttribute("user", findUser);
		}

		// 가입 되지 않은 아이디라면 DB에 추가하고 세션에 추가
		if (findUser == null) {

			userservice.joinSocial(vo);
			ses.setAttribute("user", vo);
		}

		// 받아온 사용자 정보를 view에 전달
		m.addAttribute("socialMail", email);

		return "redirect:/";
	}

	// 네이버 로그인
	@GetMapping("/login/naver/auth")
	public String naverLogin(Model m, @RequestParam String code, @RequestParam String state,
			HttpSession ses) {
		log.info(code);
		log.info(state);

		
		JsonNode jsonToken = NaverLogin.getAccessToken(code,state); 
		String accessToken = jsonToken.get("access_token").toString(); 
		String refreshToken ="";
		if(jsonToken.has("refresh_token")) { 
			refreshToken = jsonToken.get("refresh_token").toString(); 
		}
		 
		String expiresTime = jsonToken.get("expires_in").toString();
		log.info(expiresTime);
		 
		 
		// Access Token으로 사용자 정보 반환 
		JsonNode userInfo = NaverLogin.getGoogleUserInfo(accessToken);
		log.info(userInfo);
		 
		String email = userInfo.get("response").get("email").asText();
		String Name = userInfo.get("response").get("name").asText();
		 
		UserVO vo=new UserVO();
		vo.setUserName(Name);
		vo.setUserId("(naver)"+email);
		vo.setUserEmail(email);
		UUID uid = UUID.randomUUID();
		String password = uid.toString();
		vo.setUserPassword(password);
		
		// 사용자 정보 출력
		log.info(vo);

		// 가입된 아이디인지 검색
		UserVO findUser = userservice.findSocialUser(vo);

		// 이미 가입된 아이디라면 세션에 추가
		if (findUser != null) {
			ses.setAttribute("user", findUser);
		}

		// 가입 되지 않은 아이디라면 DB에 추가하고 세션에 추가
		if (findUser == null) {

			userservice.joinSocial(vo);
			ses.setAttribute("user", vo);
		}
		
		 
		return "redirect:/";
	}
	
	
	//카카오 로그인
	@GetMapping("/login/kakao/auth")
	public String kakaoLogin(Model m,@RequestParam String code,HttpSession ses) {
		log.info(code);
		
		JsonNode jsonToken = KakaoLogin.getAccessToken(code); 
		String accessToken = jsonToken.get("access_token").toString(); 
		String refreshToken ="";
		if(jsonToken.has("refresh_token")) { 
			refreshToken = jsonToken.get("refresh_token").toString(); 
		}
		 
		String expiresTime = jsonToken.get("expires_in").toString();
		log.info(expiresTime);
		 
		 
		// Access Token으로 사용자 정보 반환 
		JsonNode userInfo = KakaoLogin.getGoogleUserInfo(accessToken);
		log.info(userInfo);
		
		String Name = userInfo.get("kakao_account").get("profile").get("nickname").asText();
		String email = userInfo.get("kakao_account").get("email").asText();
		
		UserVO vo=new UserVO();
		vo.setUserName(Name);
		vo.setUserId("(kakao)"+email);
		vo.setUserEmail(email);
		UUID uid = UUID.randomUUID();
		String password = uid.toString();
		vo.setUserPassword(password);
		
		// 사용자 정보 출력
		log.info(vo);
		
		// 가입된 아이디인지 검색
		UserVO findUser = userservice.findSocialUser(vo);

		// 이미 가입된 아이디라면 세션에 추가
		if (findUser != null) {
			ses.setAttribute("user", findUser);
		}

		// 가입 되지 않은 아이디라면 DB에 추가하고 세션에 추가
		if (findUser == null) {
			userservice.joinSocial(vo);
			ses.setAttribute("user", vo);
		}
		
		return "redirect:/";
	}

	// 회원가입 서비스 실행
	@PostMapping("/joinUser")
	public String joinUser(@ModelAttribute UserVO vo) {
		log.info(vo);
		int n = userservice.joinUser(vo);
		return "index";
	}

	// 로그인 페이지 이동
	@GetMapping("login")
	public String loginGET() throws Exception {

		return "user/login";
	}

	/* 로그인 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		UserVO lvo = userservice.loginUser(user);
		if (lvo == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우

			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:login";

		}

		session.setAttribute("user", lvo); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
		session.setAttribute("id", lvo.getUserId()); //채팅웹소켓위한 session넘기기

		return "redirect:/";
	}

	// 아이디 찾기 페이지 이동
	@GetMapping("find-id")
	public String findIdGet() {
		return "user/find-id";
	}

	// 비밀번호 찾기 페이지 이동
	@GetMapping("find-password")
	public String findPasswordGet() {
		return "user/find-password";
	}

	/* 메인페이지 로그아웃 */
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";

	}

	@PostMapping(value = "/findIdAction", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String findIdAction(@RequestParam String userName, @RequestParam String userEmail) {
		UserVO vo = new UserVO();
		vo.setUserName(userName);
		vo.setUserEmail(userEmail);
		String userId = userservice.findId(vo);
		return userId;
	}

	@PostMapping(value = "/findPwdAction", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String findPwdAction(@ModelAttribute UserVO vo) {
		String userPwd = userservice.findPwd(vo);
		if (userPwd == null) {
			return "아이디, 이메일을 다시 한번 확인해주세요.";
		}
		// 메일 전송 내용
		String addr = "dmsrb9810@gmail.com";
		String subject = "비밀번호 찾기 결과";
		String body = vo.getUserId() + " 회원님의 비밀번호는 " + userPwd + " 입니다. 로그인하여 비밀번호를 변경해주세요";

		// 메일 전송
		mailService.sendEmail(vo.getUserEmail(), addr, subject, body);

		return "이메일을 확인해 주세요";
	}

	// 아이디 중복 검사
	@PostMapping(value = "/IdCheckService", produces = "application/json")
	@ResponseBody
	public int checkId(@RequestParam("userId") String userId) throws Exception { // 유저가 입력한 값을 매개변수로 한다

		int cnt = userservice.checkId(userId);
		return cnt;
	}

	// 이용약관 페이지 이동
		@GetMapping("rules")
		public String rulesGET() throws Exception{	
			return "user/rules";
	}
	// 위치기반 이용약관 페이지 이동
		@GetMapping("rules2")
		public String rules2GET() throws Exception{
			return "user/rules2";
	}
	// 위치기반 이용약관 페이지 이동
		@GetMapping("privacy")
		public String privacyGET() throws Exception{
			return "user/privacy";
	}
	
}