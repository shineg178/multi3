package three.team.project;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;
import three.user.model.UserVO;

@Log4j
@Controller
public class UserController {
	
	@GetMapping("/join")
	public String joinForm() {
		return "join/join";
	}
	
	@GetMapping("/login")
	public String loginForm() {
		return "login/login";
	}
}

