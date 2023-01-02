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

		log.info("회원가입 페이지 진입");

		return "user/join";
	}

	@PostMapping("/joinUser")
	public String joinUser(@ModelAttribute UserVO vo) {
		log.info(vo);
		int n = userservice.joinUser(vo);
		return "index";
	}

	// 로그인 페이지 이동
	@GetMapping("login")
	public String loginGET() {

		log.info("로그인 페이지 진입");

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

}