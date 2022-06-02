package com.ezen.ezenwood.mypage.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.ezenwood.mypage.service.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "MyPageService")
	private MyPageService mypageService;
	
	//마이페이지 메인 
	@RequestMapping("/main")
	public String myPage(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String getId = (String) session.getAttribute("MEMBER_ID");
		if (getId == null) {
			return "main";
		}
		return "mypage/main";
	}
	
	//회원 수정 비밀번호 입력
	
	//회원 수정 폼
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String mypageModifyForm(HttpServletRequest request)throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("MEMBER_ID");
	      return "mypage/update";
	}
	//회원 수정
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String myPageModify() {
		return "mypage/update";
	}
	
	//회원 탈퇴 폼
	@RequestMapping("/del")
	public void myPageDel() {
		
	}
	
	//주문조회
	@RequestMapping("/order")
	public String orderChk() {
		return "mypage/order";
	}
	
	/*//배송조회
	@RequestMapping*/
	
	//취소내역
	@RequestMapping("/cancle")
	public void myPageCancel() {
		
	}
	
	//리뷰리스트
	@RequestMapping("/review")
	public void myPageReview() {
		
	}
	
	//큐엔에이리스트
	@RequestMapping("/qna")
	public void myPageQna() {
		
	}
	
	//1대1문의리스트
	@RequestMapping("/oto")
	public void myPageOto() {
		
	}
	
}
