package com.ezen.ezenwood.admin.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
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

	@Resource(name = "AdminService")
	AdminService adminService;

	@RequestMapping("")
	public String admin() {
		return "admin/admin";
	}

	@RequestMapping(value = "/fqlist/{pageNum}", method = RequestMethod.GET)
	public ModelAndView fqList(@PathVariable int pageNum, CommandMap commandMap, HttpServletRequest request) throws Exception {
		
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

	@RequestMapping("/fqdetail/{fqdetailnum}")
	public ModelAndView fqDetail(@PathVariable("fqdetailnum") int fqnum) {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("QUESTION_NUM", fqnum);

		Map<String, Object> resultMap = adminService.adminFQDetail(insertMap);

		mav.addObject("FQMap", resultMap);

		mav.setViewName("/admin/fq/fqDetail");
		return mav;
	}

	@RequestMapping("/fqupdate")
	public String fqUpdate() {
		return "admin/fq/fqUpdateForm";
	}

	@RequestMapping("/fqwrite")
	public String fqWrite() {
		return "admin/fq/fqWriteForm";
	}
}
