package three.team.project;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;
import three.donation.service.DonationService;

@Controller
@Log4j
public class DonationController {

	@Autowired
	private DonationService donationService;

	// donation 기부 페이지 메서드
	@RequestMapping(value = "/donation", method = RequestMethod.GET)
	public String donationForm(Model m) {
		//기부페이지 상단 거래수와 총기부금액
		log.info("==========donationForm==========");
		m.addAttribute("totalDonation", donationService.totalDonation());
		m.addAttribute("totalDonateCount", donationService.totalDonateCount());
		m.addAttribute("donationUserCount", donationService.donationUserCount());
		m.addAttribute("pointDonation", donationService.pointDonation());
		m.addAttribute("pointDonateCount", donationService.pointDonateCount());
		//기부 순위, 기부단체설명
		m.addAttribute("userListDonate", donationService.userListDonate());
		m.addAttribute("donationOrgInfo", donationService.donationOrgInfo());
		System.out.println(m);
		return "donation/donation";
	}



}
