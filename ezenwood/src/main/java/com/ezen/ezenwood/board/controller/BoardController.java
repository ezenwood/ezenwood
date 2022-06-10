package com.ezen.ezenwood.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.common.CommandMap;
import com.ezen.ezenwood.board.service.BoardService;

@Controller

public class BoardController {

	@Resource(name = "BoardService")
	BoardService boardService;

	// OTO


	//OTO
	@RequestMapping({"/board/oto"})
	  public ModelAndView OTOList(HttpServletRequest request) {
	    ModelAndView mav = new ModelAndView();
	    HttpSession session = request.getSession();
	    String membername= (String)session.getAttribute("MEMBER_NAME");
	    Map<String, Object> insertMap = new HashMap<String, Object>();
	    insertMap.put("START", "1");
	    insertMap.put("END", "15");
	    insertMap.put("MEMBER_NAME", membername);
	    List<Map<String, Object>> OTOListMap = this.boardService.OTOList(insertMap);
	    mav.addObject("OTOListMap", OTOListMap);
	    mav.setViewName("board/oto/otoBoard");
	    return mav;
	  }

	@RequestMapping("/board/oto/otoBoard/{otonum}")
	public ModelAndView OTODetail(@PathVariable String otonum, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		String memberid = (String)session.getAttribute("MEMBER_ID");
		Map<String, Object> insertMap = new HashMap<>();
		insertMap.put("MEMBER_ID", memberid);
		insertMap.put("ONETOONE_NUM", otonum);
		Map<String, Object> resultMap = boardService.getOTODetail(insertMap);
		mav.addObject("OTOMap", resultMap);
		mav.setViewName("board/oto/otoDetail");
		return mav;
	}
	@RequestMapping("/ezenwood/board/oto/otoBoardDel/{otonum}")
	public ModelAndView OTODelete(@PathVariable String otonum, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String memberid = (String)session.getAttribute("MEMBER_ID");
		Map<String, Object> insertMap = new HashMap<>();
		insertMap.put("MEMBER_ID", memberid);
		Map<String, Object> resultMap = boardService.getOTODelete(insertMap);
		mav.addObject("OTODelMap", resultMap);
		mav.setViewName("board/oto/otoBoard");
		return mav;
	}


	
	 // 1:1 문의 삭제
	  
	  @RequestMapping(value = "/board/oto/otoBoard/{otonum}/otoDelete", method =
	  RequestMethod.POST) public String otoDelete(CommandMap commandMap,
	  HttpServletRequest request, Model model) { String MEMBER_NUM = (String)
	  request.getSession().getAttribute("MEMBER_NUM");
	  
	  commandMap.put("ONETOONE_MEMBER_NUM", MEMBER_NUM);
	  
	  int checkNum = boardService.OTODelete(commandMap.getMap(), request); if
	  (checkNum == 0) {
	  
	 } else {
	  
	 } return "redirect:/board/oto"; }
	 

	// 1:1 문의 글쓰기

	@RequestMapping(value = "/board/oto/otoWrite", method = RequestMethod.GET)
	public String otoWriteForm(CommandMap commandMap, HttpServletRequest request, Model model) {
		String writer = (String) request.getSession().getAttribute("MEMBER_ID");

		model.addAttribute("writer", writer);

		return "board/oto/otoWrite";
	}

	@RequestMapping(value = "/board/oto/otoWrite", method = RequestMethod.POST)
	public String otoWrite(CommandMap commandMap, HttpServletRequest request, Model model) {
		String MEMBER_NUM = (String) request.getSession().getAttribute("MEMBER_NUM");

		commandMap.put("ONETOONE_MEMBER_NUM", MEMBER_NUM);

		int checkNum = boardService.insertOTO(commandMap.getMap(), request);
		if (checkNum == 0) {

		} else {

		}
		return "redirect:/board/oto?idx=";
	}

	// FQ 자주 묻는 질문 리스트
	@RequestMapping("/board/fq")
	public ModelAndView FQList() {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("START", "1");
		insertMap.put("END", "10");

		List<Map<String, Object>> FQListMap = boardService.FQList(insertMap);

		mav.addObject("FQListMap", FQListMap);
		mav.setViewName("board/fq/fqBoard");
		return mav;
	}

	// Notice
	// 공지사항 리스트
	@RequestMapping("/board/notice") 
	public ModelAndView NoticeList() {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("START", "1"); insertMap.put("END", "10");
		List<Map<String, Object>> NoticeListMap = boardService.NoticeList(insertMap);
		mav.addObject("NoticeListMap", NoticeListMap);
		mav.setViewName("board/notice/noticeBoard"); 
		return mav; 
	}

	
	//공지사항 상세 페이지
	@RequestMapping("/board/notice/{NOTICE_NUM}")
	public ModelAndView noticeDetail(@PathVariable int NOTICE_NUM) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("NOTICE_NUM", NOTICE_NUM);

		Map<String, Object> resultMap = boardService.getNoticeDetail(insertMap);
		
		mav.addObject("noticeMap", resultMap);
		mav.setViewName("board/notice/noticeDetail");
		return mav;
	}



}
