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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import three.user.model.UserVO;
import three.user.service.UserService;

@Controller
@Log4j
public class UserController {

	@Autowired
	private UserService userservice;

	// 회원가입 페이지 이동
	@GetMapping("join")
	public String joinGET() {
		return "user/join";
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/userIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String userIdChkPOST(String userId) throws Exception {

		int result = userservice.idCheck(userId);
		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x

		}

	} // memberIdChkPOST() 종료

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

		// System.out.println("login 메서드 진입");
		// System.out.println("전달된 데이터 : " + user);

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

}