package com.fyp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fyp.service.MemberService;
import com.fyp.vo.MemberBoardVO;
import com.fyp.vo.MemberVO;
import com.fyp.vo.SearchCriteria;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;

	@Inject
	BCryptPasswordEncoder pwdEncoder;

	// register (GET)
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}

	// register (POST)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");

		int result = service.idChk(vo);
		try {
			if (result == 1) {
				return "/member/register";
			} else if (result == 0) {
				String inputPass = vo.getUserPw();
				String pwd = pwdEncoder.encode(inputPass);
				vo.setUserPw(pwd);

				service.register(vo);
			}
			// if there is same account -> Go back to the register page
			// if there is no account -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}

		return "redirect:/";
	}

	// login (POST)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("post login");

		session.getAttribute("member");
		MemberVO login = service.login(vo);
		boolean pwdMatch = pwdEncoder.matches(vo.getUserPw(), login.getUserPw());

		if (login != null && pwdMatch == true) {
			session.setAttribute("member", login);

		} else {
			session.setAttribute("member", null);
			//rttr.addFlashAttribute("msg", false);
		}
		return "redirect:/";

	}

	// logout (GET)
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	// update (GET)
	@RequestMapping(value = "/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {

		return "member/memberUpdateView";
	}

	// update (POST)
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception {

		service.memberUpdate(vo);
		session.invalidate();
		return "redirect:/";
	}

	// delete (GET)
	@RequestMapping(value = "/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "member/memberDeleteView";
	}

	// delete (POST)
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");

		String sessionPw = member.getUserPw();

		String voPw = vo.getUserPw();

		if (!(sessionPw.equals(voPw))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView";
		}

		service.memberDelete(vo);
		session.invalidate();
		return "redirect:/";

	}

	// profile (GET)
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model, HttpSession session) throws Exception {
		logger.info("profile");

		MemberVO member = (MemberVO) session.getAttribute("member");

		model.addAttribute("savedPostList", service.savedPostList(member));
		model.addAttribute("yourPostList", service.yourPostList(member));

		return "member/profile";
	}

	// profileSave (POST)
	@ResponseBody
	@RequestMapping(value = "/profileSave", method = RequestMethod.POST)
	public boolean profileSave(MemberBoardVO vo) throws Exception {
		logger.info("profileSave");
		int existingSave = service.savePostChk(vo);
		if (existingSave == 0) {
			service.savePost(vo);
			return true;
		}
		return false;
	}

	
	// boardReport (POST)
	@ResponseBody
	@RequestMapping(value = "/memberReport", method = RequestMethod.POST)
	public boolean profileReport(MemberBoardVO vo) throws Exception {
		logger.info("memberReport");
		int existingReport = service.reportPostChk(vo);
		if (existingReport == 0) {
			service.reportPost(vo);
			return true;
		}
		return false;
	}

	
	
	// select the list of members
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("memberList");

		model.addAttribute("memberList", service.list(scri));

		return "member/admin";
	}

	// select the list of reports
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report(Model model, HttpSession session) throws Exception {
		logger.info("reportList");
	
		model.addAttribute("reportedPostList", service.reportedPostList());
		

		return "member/report";
	}

	// check the password (Encryption)
	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public boolean passChk(MemberVO vo) throws Exception {

		MemberVO login = service.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getUserPw(), login.getUserPw());
		return pwdChk;
	}

	// ID duplicate check
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}
}