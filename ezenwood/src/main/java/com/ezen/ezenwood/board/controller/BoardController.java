package com.ezen.ezenwood.board.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.common.CommandMap;
import com.ezen.ezenwood.board.service.BoardService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller

public class BoardController {

	@Resource(name = "BoardService")
	BoardService boardService;

	//OTO
	@RequestMapping("/board/oto/{otonum}")
	  public ModelAndView OTOList(HttpServletRequest request,@PathVariable int otonum ) {
      
	    ModelAndView mav = new ModelAndView();
	    HttpSession session = request.getSession();
	    String currentPageNum = request.getParameter("searchNum");
      
	    if (currentPageNum == null||currentPageNum==""||currentPageNum.isEmpty()) {
			currentPageNum = "1";
		}
	    
	    PaginationInfo paginationInfo = new PaginationInfo();
		
		//현재 페이지 설정
		paginationInfo.setCurrentPageNo(otonum);
		
		// 한 페이지에 보여줄 게시물 갯수
		paginationInfo.setRecordCountPerPage(10);
		
		// 페이징 갯수 1~5페이지
		paginationInfo.setPageSize(5);
		
	    String membernum = (String)session.getAttribute("MEMBER_NUM");
      
	    Map<String, Object> insertMap = new HashMap<String, Object>();
      
	    insertMap.put("MEMBER_NUM", membernum);
		insertMap.put("START", paginationInfo.getFirstRecordIndex() + 1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());
	    
	    List<Map<String, Object>> OTOListMap = this.boardService.OTOList(insertMap);
      
	    mav.addObject("OTOListMap", OTOListMap);
	    int totalCount = 0;
	    totalCount = ((BigDecimal) OTOListMap.get(0).get("TOTAL_COUNT")).intValue();
		// 총 개수 
		paginationInfo.setTotalRecordCount(totalCount);
	    mav.addObject("paginationInfo", paginationInfo);
	    mav.setViewName("board/oto/otoBoard");
      
	    return mav;
	  }

	 @RequestMapping({"/board/oto/otoBoard/{otonum}"})
	  public ModelAndView OTODetail(@PathVariable String otonum, HttpServletRequest request) {
      
	    ModelAndView mav = new ModelAndView();
	    HttpSession session = request.getSession();
      
	    String memberid = (String)session.getAttribute("MEMBER_ID");
      
	    
	    Map<String, Object> insertMap = new HashMap<String, Object>();
      
	    insertMap.put("MEMBER_ID", memberid);
	    insertMap.put("ONETOONE_NUM", otonum);
      
	    Map<String, Object> resultMap = this.boardService.getOTODetail(insertMap);
      
	    mav.addObject("OTOMap", resultMap);
	    mav.setViewName("board/oto/otoDetail");
      
	    return mav;
	  }

	// 1:1 문의 삭제
	@RequestMapping({ "/board/oto/otoBoardDel/{otonum}" })
	public ModelAndView OTODelete(@PathVariable String otonum, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		String memberid = (String) session.getAttribute("MEMBER_ID");

		Map<String, Object> insertMap = new HashMap<String, Object>();
		
		insertMap.put("MEMBER_ID", memberid);
		insertMap.put("ONETOONE_NUM", otonum);
		
		Map<String, Object> resultMap = this.boardService.getOTODelete(insertMap);

		mav.addObject("OTODelMap", resultMap);
		mav.setViewName("redirect:/board/oto");
		
		return mav;
	}

	// 1:1 문의 글쓰기

	@RequestMapping(value = "/board/oto/otoWrite", method = RequestMethod.GET)
	public ModelAndView otoWriteForm(HttpServletRequest request) {

		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		String writer = (String) session.getAttribute("MEMBER_ID");
		String name = (String) session.getAttribute("MEMBER_NAME");

		Map<String, Object> insertMap = new HashMap<String, Object>();
		
		insertMap.put("MEMBER_ID", writer);
		insertMap.put("MEMBER_NAME", name);
		
		Map<String, Object> resultMap = this.boardService.getinsertOTOGET(insertMap);
		
		mav.addObject("OTOInsertMap", resultMap);
		mav.setViewName("board/oto/otoWrite");
		
		return mav;
	}

	@RequestMapping(value = "/board/oto/otoWrite", method = RequestMethod.POST)
	public String otoWrite(CommandMap commandmap, HttpServletRequest request,HttpServletResponse response, MultipartFile file) throws Exception {
		
		Map<String, Object> insertMap = commandmap.getMap();
		
		String MEMBER_NUM = (String) request.getSession().getAttribute("MEMBER_NUM");
		String MEMBER_ID = (String) request.getSession().getAttribute("MEMBER_ID");
		
		insertMap.put("ONETOONE_MEMBER_NUM", MEMBER_NUM);
		insertMap.put("MEMBER_ID", MEMBER_ID);
		insertMap.put("request", request);
		
		int result =boardService.insertOTO(insertMap, request);
		if( result==1) {
			
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('작성실패 제목과 내용을 모두 적어주세요.'); location.href='" + request.getContextPath()
					+ "/board/oto/1';</script>");
			out.flush();
		}
		
		return "redirect:/board/oto/1";
		
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
		
		insertMap.put("START", "1");
		insertMap.put("END", "10");
		
		List<Map<String, Object>> NoticeListMap = boardService.NoticeList(insertMap);
		
		mav.addObject("NoticeListMap", NoticeListMap);
		mav.setViewName("board/notice/noticeBoard");
		
		return mav;
	}

	// 공지사항 상세 페이지
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
