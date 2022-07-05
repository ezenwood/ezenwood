package com.ezen.ezenwood.member.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.log4j.Logger;
import org.hamcrest.core.IsEqual;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.common.CommandMap;
import com.ezen.ezenwood.member.EmailDTO;
import com.ezen.ezenwood.member.service.LoginService;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "loginService")
	private LoginService loginService;

	@Autowired

	private JavaMailSenderImpl mailSender;

	private Map<String, EmailDTO> emailMap = new HashMap<String, EmailDTO>();

	@RequestMapping(value = "/emailcheck", method = RequestMethod.GET)
	public String emailcheck(HttpServletRequest request) {
		String code = request.getParameter("code");
		EmailDTO emaildto = emailMap.get(code);

		if (emaildto == null) {
			// 유효하지 않은 주소
			return "member/login/emailTimeOver";

		} else {
			Date date = new Date();
			if (date.getTime() - emaildto.getTime() < 600000) {
				int checkNum = loginService.emailcheck(emaildto.getMemberNum());
				if (checkNum == 1) {// 인증완료
					return "member/login/emailSuccess";
				}
				emailMap.remove(code);
			} else {
				//시간 만료시
				emailMap.remove(code);
				return "member/login/emailTimeOver";
			}
		}

		return "redirect:/main";
	}

	// loginForm
	@RequestMapping(value = "/member/signin", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String getnum = (String) session.getAttribute("MEMBER_NUM");
		if (getnum == null) {
			return "/member/login/signin";
		}
		return "main";
	}

	// login
	@RequestMapping(value = "/member/signin", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView("main");

		Map<String, Object> result = loginService.login(commandMap.getMap());

		if (result == null || result.isEmpty()) {

			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인실패 Try Again'); location.href='" + request.getContextPath()
					+ "/main';</script>");
			out.flush();

		} else {

			if (result.get("MEMBER_EMAIL_CHECK").equals("N")) {
				Date date = new Date();
				String code = UUID.randomUUID().toString().replace("-", "")
						+ UUID.randomUUID().toString().replace("-", "");
				EmailDTO emaildto = new EmailDTO();
				emaildto.setTime(date.getTime());
				emaildto.setCode(code);
				emaildto.setEmail((String) result.get("MEMBER_EMAIL"));
				emaildto.setMemberNum(((BigDecimal) result.get("MEMBER_NUM")).toString());
				sendEmail(emaildto);
				emailMap.put(code, emaildto);
				//이메일 인증 발송 페이지

				mav.setViewName("/member/login/emailSend");
				return mav;
			}

			HttpSession session = request.getSession();
			session.setAttribute("MEMBER_ID", result.get("MEMBER_ID"));
			session.setAttribute("MEMBER_PW", result.get("MEMBER_PW"));
			session.setAttribute("MEMBER_NUM", ((BigDecimal) result.get("MEMBER_NUM")).toString());
			session.setAttribute("MEMBER_NAME", result.get("MEMBER_NAME"));
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");

			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 성공!'); location.href='" + request.getContextPath() + "/main';</script>");
			out.flush();
		}

		return mav;
	}

	// logout
	@RequestMapping(value = "/member/signout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap)
			throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(
				"<script>alert('로그아웃 완료! Logout'); location.href='" + request.getContextPath() + "/main';</script>");

		out.flush();
	}

	// findIdForm
	@RequestMapping(value = "/member/idfind", method = RequestMethod.GET)
	public ModelAndView findIdForm() throws Exception {
		ModelAndView mv = new ModelAndView("member/login/findId");
		return mv;
	}

	// findIdForm기능
	@RequestMapping(value = "/member/idfind", method = RequestMethod.POST)
	public ModelAndView findId(CommandMap commandMap, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		//
		Map<String, Object> map = loginService.findId(commandMap.getMap());

		if (map == null || map.isEmpty()) {

			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");

			PrintWriter out = response.getWriter();

			out.println("<script>alert('아이디와 이메일을 입력해주세요.'); </script>");
			out.flush();

			mav.setViewName("member/login/findId");
		} else {

			mav.addObject("MEMBER_ID", map.get("MEMBER_ID"));
			mav.setViewName("member/login/resultId");
		}

		return mav;
	}

	// findPwForm
	@RequestMapping(value = "/member/pwfind", method = RequestMethod.GET)
	public ModelAndView findPwForm() throws Exception {
		ModelAndView mav = new ModelAndView("/member/login/findPw");
		return mav;
	}

	@RequestMapping(value = "/member/pwfind", method = RequestMethod.POST)
	public ModelAndView findPw(CommandMap commandMap, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> map = loginService.findPw(commandMap.getMap());

		if (map == null || map.isEmpty()) {

			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");

			PrintWriter out = response.getWriter();

			out.println("<script>alert('아이디와 이메일을 입력해주세요.'); </script>");
			out.flush();

			mav.setViewName("member/login/findPw");
		} else {

			mav.addObject("MEMBER_PW", map.get("MEMBER_PW"));
			mav.setViewName("member/login/resultPw");
		}

		return mav;
	}

	// 이메일
	public void sendEmail(EmailDTO emaildto) {
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("k1m1nsu9805@gmail.com");
				helper.setTo(emaildto.getEmail());
				helper.setSubject("이젠우드 인증 이메일 입니다.");
				helper.setText("이메일 인증버튼을 누르면 이메일 인증이 됩니다.\r\n" + "http://localhost:9001/ezenwood/emailcheck?code="
						+ emaildto.getCode());
			}
		};

		mailSender.send(preparator);
	}

}
