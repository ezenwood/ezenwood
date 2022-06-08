package com.ezen.ezenwood.mypage.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.common.CommandMap;
import com.ezen.ezenwood.mypage.service.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "MyPageService")
	private MyPageService mypageService;

	// 마이페이지 메인
	@RequestMapping("/main")
	public String myPage(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String getId = (String) session.getAttribute("MEMBER_ID");
		session.getAttribute("MEMBER_PW");
		if (getId == null) {
			return "main";
		}
		return "mypage/main";
	}

	// 회원 수정 비밀번호 입력 폼
	@RequestMapping(value = "/pwch", method = RequestMethod.GET)
	public String mypagePwChForm(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("MEMBER_ID");
		session.getAttribute("MEMBER_PW");

		return "mypage/pwch";
	}

	// 회원 수정 비밀번호 입력
	@RequestMapping(value = "/pwch", method = RequestMethod.POST)
	public ModelAndView mypagePwCh(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Map<String, Object> result = mypageService.memberInfo(commandMap.getMap());

		if (result == null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 일치하지않습니다. Cheking your Password'); location.href='"
					+ request.getContextPath() + "/mypage/pwch';</script>");
			out.flush();
		} else {
			if (result.get("MEMBER_PW").equals(commandMap.get("MEMBER_PW"))) { // 비밀번호가 같다면
				session.setAttribute("MEMBER_ID", result.get("MEMBER_ID"));
				session.setAttribute("MEMBER_PW", result.get("MEMBER_PW"));
			}

		}

		session.setAttribute("session", mav);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		out.println(
				"<script>alert('로그인 성공!'); location.href='" + request.getContextPath() + "/mypage/update';</script>");

		out.flush();
		return mav;
	}

	// 회원 수정 폼
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String mypageModifyForm(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("MEMBER_ID");
		return "mypage/update";
	}

	// 회원 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView myPageModify(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		int memberInfo = mypageService.memberUpdate(commandMap.getMap());

		mav.addObject(memberInfo);

		mav.setViewName("/mypage/main");
		return mav;
	}

	// 회원 탈퇴 폼
	@RequestMapping(value = "/del", method = RequestMethod.GET)
	public String myPageDelForm(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("MEMBER_ID");
		return "mypage/del";
	}

	// 회원 탈퇴 폼
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	public ModelAndView myPageDel(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		int memberInfo = mypageService.memberDelete(commandMap.getMap());

		mav.addObject(memberInfo);
		
		session.invalidate();
		mav.setViewName("/main");
		return mav;
	}

	// 주문조회 & 배송조회 폼
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String orderChkForm() {
		return "mypage/order";
	}

	// 주문조회 & 배송조회
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String orderChk() {
		return "mypage/order";
	}

	// 취소내역 폼
	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public void myPageCancelForm() {

	}

	// 취소내역
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public void myPageCancel() {

	}

	// 리뷰리스트 폼
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public void myPageReviewForm() {

	}

	// 리뷰리스트
	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public void myPageReview() {

	}

	// 큐엔에이리스트 폼
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public void myPageQnaForm() {

	}

	// 큐엔에이리스트
	@RequestMapping(value = "/qna", method = RequestMethod.POST)
	public void myPageQna() {

	}

	// 1대1문의리스트 폼
	@RequestMapping(value = "/oto", method = RequestMethod.GET)
	public void myPageOtoForm() {

	}

	// 1대1문의리스트
	@RequestMapping(value = "/oto", method = RequestMethod.POST)
	public void myPageOto() {

	}

}
