package three.team.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import three.mail.service.MailService;
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

	// 회원가입 서비스 실행
	@PostMapping("/joinUser")
	public String joinUser(@ModelAttribute UserVO vo) {
		log.info(vo);
		int n = userservice.joinUser(vo);
		return "index";
	}

	// 로그인 페이지 이동
	@GetMapping("login")
	public String loginGET() {
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

		return "redirect:/";
	}
	/*
	 * 구글아이디로 로그인
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/loginGoogle", method = RequestMethod.POST) public
	 * String loginGooglePOST(UserVO vo, HttpSession session, RedirectAttributes
	 * rttr, UserVO mvo) throws Exception { UserVO returnVO =
	 * userservice.loginUserByGoogle(vo); String mvo_ajaxid = mvo.getUserId();
	 * System.out.println("C: 구글아이디 포스트 db에서 가져온 vo " + vo);
	 * System.out.println("C: 구글아이디 포스트 ajax에서 가져온 id " + mvo_ajaxid);
	 * 
	 * if (returnVO == null) { // 아이디가 DB에 존재하지 않는 경우 // 구글 회원가입
	 * userservice.joinUserByGoogle(vo);
	 * 
	 * // 구글 로그인 returnVO = userservice.loginUserByGoogle(vo);
	 * session.setAttribute("id", returnVO.getUserId());
	 * rttr.addFlashAttribute("mvo", returnVO); }
	 * 
	 * if (mvo_ajaxid.equals(returnVO.getUserId())) { // 아이디가 DB에 존재하는 경우 // 구글 로그인
	 * userservice.loginUserByGoogle(vo); session.setAttribute("id",
	 * returnVO.getUserId()); rttr.addFlashAttribute("mvo", returnVO); } else {//
	 * 아이디가 DB에 존재하지 않는 경우 // 구글 회원가입 userservice.joinUserByGoogle(vo);
	 * 
	 * // 구글 로그인 returnVO = userservice.loginUserByGoogle(vo);
	 * session.setAttribute("id", returnVO.getUserId());
	 * rttr.addFlashAttribute("mvo", returnVO); }
	 * 
	 * return "redirect:/"; }
	 */

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
	
	@PostMapping(value="/findIdAction",produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String findIdAction(@RequestParam String userName,@RequestParam String userEmail) {
		UserVO vo= new UserVO();
		vo.setUserName(userName);
		vo.setUserEmail(userEmail);
		String userId = userservice.findId(vo);
		return userId;
	}
	
	@PostMapping(value="/findPwdAction",produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String findPwdAction(@ModelAttribute UserVO vo) {
		String userPwd=userservice.findPwd(vo);
		if(userPwd==null) {
			return "아이디, 이메일을 다시 한번 확인해주세요.";
		}
		//메일 전송 내용
		String addr = "dmsrb9810@gmail.com";
		String subject = "비밀번호 찾기 결과";
		String body = vo.getUserId()+" 회원님의 비밀번호는 "+userPwd+" 입니다";
				
				//메일 전송
		mailService.sendEmail(vo.getUserEmail(), addr, subject, body);
		
		
		return "이메일을 확인해 주세요";
	}

}