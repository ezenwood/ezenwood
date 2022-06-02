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
		String getId = (String) session.getAttribute("MEMBER_ID");
		if (getId == null) {
			return "/member/login/signin";
		}
		return "main";
	}

	// login
	@RequestMapping(value = "/member/signin", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> result = loginService.login(commandMap.getMap());
		
		if (result == null || result.get("MEMBER_DEL_GB").equals("Y")) {
			// 아이디가 있는지 or 삭제된 아이디인지 확인


			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인실패 Try Again'); location.href='" + request.getContextPath()
					+ "/member/signin';</script>");
			out.flush();

		} else {
			if (result.get("MEMBER_PW").equals(commandMap.get("MEMBER_PW"))) { // ��й�ȣ�� ���ٸ�
				mav.addObject("MEMBER_ID","MEMBER_ID");
				mav.setViewName("/main");

			} else {// 비밀번호가 일치하지 않을 때
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('비밀번호가 일치하지않습니다. Cheking your Password'); location.href='"
						+ request.getContextPath() + "/member/signin';</script>");
				out.flush();

			}
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		out.println("<script>alert('로그인 성공!'); location.href='" + request.getContextPath() + "/main';</script>");
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
				"<script>alert('로그아웃 완료! Logout'); location.href='" + request.getContextPath() + "/main';</script>");

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
