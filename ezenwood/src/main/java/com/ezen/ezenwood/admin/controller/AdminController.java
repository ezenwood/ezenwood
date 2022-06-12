package com.ezen.ezenwood.admin.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.common.CommandMap;
import com.ezen.ezenwood.admin.service.AdminService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("")
	public String admin() {
		return "admin/admin";
	}

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "AdminService")
	private AdminService adminService;

	// notice

	@RequestMapping(value = "/notice/{pageNum}", method = RequestMethod.GET)
	public ModelAndView adminNoticeList(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
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

		List<Map<String, Object>> list = adminService.adminNoticeList(insertMap);
		mv.addObject("list", list);

		int totalCount = 0;

		if (list.isEmpty()) {

		} else {
			totalCount = ((BigDecimal) list.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mv.addObject("paginationInfo", paginationInfo);

		}

		mv.setViewName("admin/notice/noticeList");
		return mv;
	}

	// fq

	@RequestMapping(value = "/fqlist/{pageNum}", method = RequestMethod.GET)
	public ModelAndView fqList(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request)
			throws Exception {

		ModelAndView mv = new ModelAndView();

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

		List<Map<String, Object>> list = adminService.adminFQList(insertMap);
		mv.addObject("list", list);

		int totalCount = 0;

		if (list.isEmpty()) {

		} else {
			totalCount = ((BigDecimal) list.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mv.addObject("paginationInfo", paginationInfo);

		}

		mv.setViewName("/admin/fq/fqList");
		return mv;
	}

	@RequestMapping("/fqdetail/{fqNum}")
	public ModelAndView fqDetail(@PathVariable int fqNum) throws Exception{
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("QUESTION_NUM", fqNum);

		Map<String, Object> resultMap = adminService.adminFQDetail(insertMap);

		mav.addObject("FQMap", resultMap);

		mav.setViewName("/admin/fq/fqDetail");
		return mav;
	}

	
	
	@RequestMapping(value = "/fqupdate/{fqNum}", method = RequestMethod.GET)
	public ModelAndView fqUpdateForm(@PathVariable int fqNum, CommandMap commandMap)
			throws Exception {
		ModelAndView mav = new ModelAndView();	
		
		mav.addObject("QUESTION_NUM", fqNum);
		mav.setViewName("/admin/fq/fqUpdateForm");
		return mav;
	}

	@RequestMapping(value = "/fqupdate/{fqNum}", method = RequestMethod.POST)
	public ModelAndView fqUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();

		int resultMap = adminService.adminFQUpdate(commandMap.getMap());

		mav.addObject(resultMap);
		
		mav.setViewName("/admin/fq/fqList");
		return mav;
	}
	
	@RequestMapping(value = "/fqwrite", method = RequestMethod.GET)
	public String fqWriteForm() throws Exception{
		
		
		return "/admin/fq/fqWriteForm";

	}

	@RequestMapping(value = "/fqwrite", method = RequestMethod.POST)
	public String fqWrite(CommandMap commandMap) throws Exception {
		
		int resultMap = adminService.adminFQInsert(commandMap.getMap());

		return "redirect:/admin/fq/fqList";

	}
	
	
	@RequestMapping(value="/fqdelete/{fqNum}", method=RequestMethod.GET)
	public ModelAndView fqdelete(@PathVariable int fqNum) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		
		int QUESTION_NUM = fqNum;

		insertMap.put("QUESTION_NUM", QUESTION_NUM);
		int resultMap = adminService.adminFQDelete(insertMap);
		
		mav.addObject(resultMap);
		mav.setViewName("/admin/fq/fqList");
		return mav;
	}

}
