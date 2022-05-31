package com.ezen.ezenwood.mypage.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.ezenwood.mypage.service.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "MyPageService")
	private MyPageService mypageService;
	
	//마이페이지 메인 
	@RequestMapping("/main")
	public String myPage() {
		return "mypage/main";
	}
	
	//회원 수정 페이지 
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String myPageModify() {
		return "mypage/update";
	}
	
	//회원 탈퇴
	@RequestMapping("/del")
	public void myPageDel() {
		
	}
	
	//주문조회
	@RequestMapping("/order")
	public void orderChk() {
		
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
