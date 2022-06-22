package com.ezen.ezenwood.member.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.log4j.Logger;
import org.hamcrest.core.IsEqual;
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

}
