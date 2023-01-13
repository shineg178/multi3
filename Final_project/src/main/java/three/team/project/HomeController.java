package three.team.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;
import three.user.model.UserVO;
import three.user.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	private UserService userservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale,HttpSession ses, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );		
		
		UserVO vo=(UserVO)ses.getAttribute("user");
		if(vo != null) {
			UserVO user=this.userservice.findUserByUserId(vo.getUserId());
			ses.setAttribute("user", user);
		}
		
		return "index";
	}
	
	@RequestMapping("/top")
	public String top() {
		return "top";
	}
	
	@RequestMapping("/foot")
	public String foot() {
		return "foot";
	}
	
}

