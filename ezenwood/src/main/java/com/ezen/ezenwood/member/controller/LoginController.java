package com.ezen.ezenwood.member.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.common.CommandMap;
import com.ezen.ezenwood.member.service.LoginService;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "loginService")
	private LoginService loginService;

	// loginForm
	@RequestMapping(value = "/member/signin")
	public String loginForm(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String getId = (String) session.getValue("MEMBER_ID");
		if (getId == null) {
			return "/member/login/signin";
		}
		return "main";
	}

	// login
	@RequestMapping(value = "/member/signin", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView("main");
		HttpSession session = request.getSession();
		Map<String, Object> result = loginService.login(commandMap.getMap());

		if (result == null || result.get("DEL_GB").equals("Y")) {
			// ���̵� �ִ��� or ������ ���̵����� Ȯ��

			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�α��ν��� Try Again'); location.href='" + request.getContextPath()
					+ "/main';</script>");
			out.flush();

		} else {
			if (result.get("MEMBER_PW").equals(commandMap.get("MEMBER_PW"))) { // ��й�ȣ�� ���ٸ�
				session.setAttribute("MEMBER_ID", commandMap.get("MEMBER_ID"));
				session.setAttribute("MEMBER_NAME", result.get("MEMBER_NAME"));
				session.setAttribute("MEMBER_EMAIL", result.get("MEMBER_EMAIL"));
				session.setAttribute("MEMBER_PHONE", result.get("MEMBER_PHONE"));
				session.setAttribute("MEMBER_ZIP", result.get("MEMBER_ZIP"));
				session.setAttribute("MEMBER_ADD1", result.get("MEMBER_ADD1"));
				session.setAttribute("MEMBER_ADD2", result.get("MEMBER_ADD2"));
				session.setAttribute("MEMBER_ADD3", result.get("MEMBER_ADD3"));
				session.setAttribute("MEMBER_JOINDATE", result.get("MEMBER_JOINDATE"));

			} else {// ��й�ȣ�� ��ġ���� ���� ��
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('��й�ȣ�� ��ġ�����ʽ��ϴ�. Cheking your Password'); location.href='"
						+ request.getContextPath() + "/signin';</script>");
				out.flush();

			}
		}

		session.setAttribute("session", mav);

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		out.println("<script>alert('�α��� ����!'); location.href='" + request.getContextPath() + "/main';</script>");

		out.flush();
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
				"<script>alert('�α׾ƿ� �Ϸ�! Logout'); location.href='" + request.getContextPath() + "/main';</script>");

		out.flush();
	}

	// findIdForm
	@RequestMapping(value = "/member/idfind")
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/login/findId");
		return mv;
	}

	// findIdResult
	@RequestMapping(value = "/member/idresult", method = RequestMethod.POST)
	public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/login/resultId");
		List<Map<String, Object>> list = loginService.findId(commandMap.getMap());
		mv.addObject("list", list);
		return mv;

	}

	// findPwForm
	@RequestMapping(value = "/member/pwfind")
	public ModelAndView findPw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/login/findPw");
		return mv;
	}

	// findPwResult
	@RequestMapping(value = "/member/pwresult", method = RequestMethod.POST)
	public ModelAndView findPwResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/login/resultPw");
		List<Map<String, Object>> list = loginService.findPw(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
}
