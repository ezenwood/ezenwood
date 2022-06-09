package com.ezen.ezenwood.mypage.controller;

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
import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.common.CommandMap;
import com.ezen.ezenwood.mypage.service.MyPageService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

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


	// 주문조회 & 배송조회 리스트
	@RequestMapping(value = "/order/{pageNum}", method = RequestMethod.GET)
	public ModelAndView orderChkListForm(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		PaginationInfo paginationInfo = new PaginationInfo();

		// 현재 페이지 번호
		paginationInfo.setCurrentPageNo(pageNum);
		// 한 페이지에 게시되는 게시물 건수
		paginationInfo.setRecordCountPerPage(9);
		// 페이징 리스트의 사이즈
		paginationInfo.setPageSize(5);

		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());
		insertMap.put("MEMBER_ID", MEMBER_ID);

		
		List<Map<String,Object>> orderList = mypageService.orderList(insertMap);

		int totalCount = 0;

		if (orderList.isEmpty()) {

		} else {
			totalCount = orderList.size();

			totalCount = ((BigDecimal) orderList.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mav.addObject("paginationInfo",paginationInfo);
		}
		
		
		mav.addObject("orderList",orderList);

		mav.setViewName("/mypage/order");
		return mav;
	}

	// 취소내역 폼
	@RequestMapping(value = "/cancel/{pageNum}", method = RequestMethod.GET)
	public ModelAndView myPageCancelForm(@PathVariable int pageNum, CommandMap commandMap,HttpServletRequest request)throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String MEMBER_ID = (String)session.getAttribute("MEMBER_ID");
		
		
		Map<String, Object> insertMap =  new HashMap<String,Object>();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//현재 페이지 번호
		paginationInfo.setCurrentPageNo(pageNum);
		//한 페이지에 게시되는 게시물 건수
		paginationInfo.setRecordCountPerPage(9);
		//페이징 리스트의 사이즈
		paginationInfo.setPageSize(5);
		
		insertMap.put("START", paginationInfo.getFirstRecordIndex()+1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());
		insertMap.put("MEMBER_ID", MEMBER_ID);
		
		List<Map<String,Object>> cancelList = mypageService.cancelOrder(insertMap);
		
		int totalCount = 0;
		
		if(cancelList.isEmpty()) {
		
		}else {
			totalCount = cancelList.size();
			totalCount = ((BigDecimal) cancelList.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mav.addObject("paginationInfo",paginationInfo);
		}
		
		
		mav.addObject("cancelList",cancelList);
		mav.setViewName("/mypage/cancel");
		return mav;
	}
	

	// 리뷰리스트 폼
	@RequestMapping(value = "/review/{pageNum}", method = RequestMethod.GET)
	public ModelAndView myPageReviewForm(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
			throws Exception {

		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		PaginationInfo paginationInfo = new PaginationInfo();

		// 현재 페이지 번호
		paginationInfo.setCurrentPageNo(pageNum);
		// 한 페이지에 게시되는 게시물 건수
		paginationInfo.setRecordCountPerPage(9);
		// 페이징 리스트의 사이즈
		paginationInfo.setPageSize(5);

		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());
		insertMap.put("MEMBER_ID", MEMBER_ID);

		List<Map<String, Object>> list = mypageService.memberReivewList(insertMap);
		mv.addObject("list", list);

		int totalCount = 0;

		if (list.isEmpty()) {

		} else {
			totalCount = ((BigDecimal) list.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mv.addObject("paginationInfo", paginationInfo);

		}

		mv.setViewName("/mypage/review");
		return mv;
	}

	// 큐엔에이리스트 폼
	@RequestMapping(value = "/qna/{pageNum}", method = RequestMethod.GET)
	public ModelAndView myPageQNAForm(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
			throws Exception {

		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		PaginationInfo paginationInfo = new PaginationInfo();

		// 현재 페이지 번호
		paginationInfo.setCurrentPageNo(pageNum);
		// 한 페이지에 게시되는 게시물 건수
		paginationInfo.setRecordCountPerPage(9);
		// 페이징 리스트의 사이즈
		paginationInfo.setPageSize(5);

		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());
		insertMap.put("MEMBER_ID", MEMBER_ID);

		List<Map<String, Object>> list = mypageService.memberQNAList(insertMap);
		mv.addObject("list", list);

		int totalCount = 0;

		if (list.isEmpty()) {

		} else {
			totalCount = ((BigDecimal) list.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mv.addObject("paginationInfo", paginationInfo);

		}

		mv.setViewName("/mypage/qna");
		return mv;
	}

	// 1대1문의리스트 폼
	@RequestMapping(value = "/oto/{pageNum}", method = RequestMethod.GET)
	public ModelAndView myPageOtOForm(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
			throws Exception {

		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");

		Map<String, Object> insertMap = new HashMap<String, Object>();

		PaginationInfo paginationInfo = new PaginationInfo();

		// 현재 페이지 번호
		paginationInfo.setCurrentPageNo(pageNum);
		// 한 페이지에 게시되는 게시물 건수
		paginationInfo.setRecordCountPerPage(9);
		// 페이징 리스트의 사이즈
		paginationInfo.setPageSize(5);

		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());
		insertMap.put("MEMBER_ID", MEMBER_ID);

		List<Map<String, Object>> list = mypageService.memberOTOList(insertMap);
		mv.addObject("list", list);

		int totalCount = 0;

		if (list.isEmpty()) {

		} else {
			totalCount = ((BigDecimal) list.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mv.addObject("paginationInfo", paginationInfo);

		}

		mv.setViewName("/mypage/oto");
		return mv;
	}

}
