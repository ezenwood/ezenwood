package com.ezen.ezenwood.goods.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.common.CommandMap;
import com.ezen.ezenwood.goods.service.GoodsService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller

public class GoodsController {

	@Resource(name = "GoodsService")
	GoodsService goodsService;

	@RequestMapping("/goods/{category}/{searchType}/{pageNum}")
	public ModelAndView goodsList(@PathVariable String searchType , @PathVariable String category ,@PathVariable int pageNum ,HttpServletRequest request ) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("GOODS_CATEGORY", category);
		insertMap.put("searchType", searchType);
		
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//현재 페이지 설정
		paginationInfo.setCurrentPageNo(pageNum);
		
		// 한 페이지에 보여줄 게시물 갯수
		paginationInfo.setRecordCountPerPage(9);
		
		// 페이징 갯수 1~5페이지
		paginationInfo.setPageSize(5);
		
		
		
		insertMap.put("START", paginationInfo.getFirstRecordIndex()+1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());
		
		List<Map<String,Object>> goodsList = goodsService.goodsList(insertMap);
		
		mav.addObject("goodsList", goodsList);
		
		//insertMap.put("currentPageNum", pageNum);
		
		int totalCount = 0;
		
		if(goodsList.isEmpty()) {
			
		}else {
			totalCount = ((BigDecimal) goodsList.get(0).get("TOTAL_COUNT")).intValue();
			// 총 개수 
			paginationInfo.setTotalRecordCount(totalCount);
			mav.addObject("paginationInfo", paginationInfo);
		}
		
		 
		
		
		
		
		
		mav.setViewName("goods/list");
		
		return mav;
	}

	@RequestMapping("/goods")
	public ModelAndView goodsDetail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String goodsNum = request.getParameter("idx");

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("GOODS_NUM", goodsNum);

		Map<String, Object> GOODS_MAP = goodsService.goodsDetail(insertMap);

		insertMap.put("QNA_PARENT", goodsNum);
		insertMap.put("START", 1);
		insertMap.put("END", 5);

		List<Map<String, Object>> QNAListMap = goodsService.getQNAListForDetail(insertMap);
		mav.addObject("QNAListMap", QNAListMap);

		List<Map<String, Object>> reviewListMap = goodsService.getReviewListForDetail(insertMap);

		mav.addObject("reviewListMap", reviewListMap);

		mav.addObject("GOODS_MAP", GOODS_MAP);
		mav.setViewName("goods/detail");

		return mav;
	}

	@RequestMapping(value = "/goods/qna/write", method = RequestMethod.GET)
	public String qnaWriteForm(CommandMap commandMap, HttpServletRequest request, Model model) {
		String writer = (String) request.getSession().getAttribute("MEMBER_ID");
		
		String QNA_PARENT = request.getParameter("GOODS_NUM");

		String GOODS_TITLE = goodsService.getGoodsTitle(QNA_PARENT);
		model.addAttribute("writer", writer);
		model.addAttribute("QNA_PARENT", QNA_PARENT);
		// model.addAttribute("IMAGE_PARENT", QNA_PARENT);
		model.addAttribute("GOODS_TITLE", GOODS_TITLE);
		// model.addAttribute("IMAGE_TABLENAMES_TABLENAME", "QNA");

		return "goods/qnaWrite";
	}

	@RequestMapping(value = "/goods/qna/write", method = RequestMethod.POST)
	public String qnaWrite(CommandMap commandMap, HttpServletRequest request, Model model) {
		String MEMBER_NUM = (String) request.getSession().getAttribute("MEMBER_NUM");
		
		
		String QNA_PARENT = request.getParameter("QNA_PARENT");
		commandMap.put("QNA_WRITER", MEMBER_NUM);
		if (commandMap.get("QNA_SECREAT") == null) {
			commandMap.put("QNA_SECREAT", "N");
		}
		int checkNum = goodsService.insertQNA(commandMap.getMap(), request);
		if (checkNum == 0) {

		} else {

		}
		return "redirect:/goods?idx=" + QNA_PARENT;
	}

	@RequestMapping("/goods/qna")
	public ModelAndView qnaList(HttpServletRequest request) {
		
		String currentPage = request.getParameter("p");
		String QNA_PARENT = request.getParameter("GOODS_NUM");
		
		

		ModelAndView mav = new ModelAndView();
		
		
		mav.addObject("GOODS_NUM", QNA_PARENT);

		Map<String, Object> insertMap = new HashMap<String, Object>();
		
		insertMap.put("QNA_PARENT", QNA_PARENT);
		
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//
		paginationInfo.setCurrentPageNo(Integer.parseInt(currentPage));
		
		//
		paginationInfo.setPageSize(5);
		//
		paginationInfo.setRecordCountPerPage(5);
		
		
		
		
		insertMap.put("START", paginationInfo.getFirstRecordIndex()+1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());

		List<Map<String, Object>> QNAListMap = goodsService.QNAList(insertMap);
		
		int totalCount = 0;
		
		if(QNAListMap.isEmpty()) {
			//
		}else {
			totalCount = ((BigDecimal)QNAListMap.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mav.addObject("paginationInfo", paginationInfo);
		}
		
		
		
		
		

		mav.addObject("QNAListMap", QNAListMap);

		mav.setViewName("goods/qnaList");
		return mav;
	}

	@RequestMapping("/goods/qna/{qnanoumdomodmsa}")
	public ModelAndView qnaDetail(@PathVariable("qnanoumdomodmsa") int qnanum) {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("QNA_NUM", qnanum);

		Map<String, Object> resultMap = goodsService.getQNADetail(insertMap);

		mav.addObject("QNAMap", resultMap);

		mav.setViewName("goods/qnaDetail");
		return mav;
	}

	@RequestMapping(value = "/goods/review/write", method = RequestMethod.GET)
	public ModelAndView reviewWriteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String GOODS_NUM = request.getParameter("GOODS_NUM");

		String MEMBER_ID = (String) request.getSession().getAttribute("MEMBER_ID");

		String GOODS_TITLE = goodsService.getGoodsTitle(GOODS_NUM);

		String REVIEW_PARENT = GOODS_NUM;

		mav.addObject("GOODS_TITLE", GOODS_TITLE);
		mav.addObject("MEMBER_ID", MEMBER_ID);
		mav.addObject("REVIEW_PARENT", REVIEW_PARENT);

		mav.setViewName("goods/reviewWrite");
		return mav;
	}

	@RequestMapping(value = "/goods/review/write", method = RequestMethod.POST)
	public ModelAndView reviewWrite(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		commandMap.put("MEMBER_ID", request.getSession().getAttribute("MEMBER_ID"));

		int checkNum = goodsService.insertReview(commandMap.getMap(), request);

		mav.setViewName("redirect:/goods?idx=" + commandMap.get("REVIEW_PARENT"));
		return mav;
	}

	@RequestMapping("/goods/review/{REVIEW_NUM}")
	public ModelAndView reviewDetail(@PathVariable int REVIEW_NUM) {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("REVIEW_NUM", REVIEW_NUM);

		Map<String, Object> resultMap = goodsService.getReviewDetail(insertMap);

		mav.addObject("reviewMap", resultMap);

		mav.setViewName("goods/reviewDetail");
		return mav;
	}
	
	@RequestMapping("/goods/review")
	public ModelAndView reviewList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String GOODS_NUM = request.getParameter("GOODS_NUM");
		String currentPage = request.getParameter("p");
		
		mav.addObject("GOODS_NUM", GOODS_NUM);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(Integer.parseInt(currentPage));
		paginationInfo.setPageSize(5);
		paginationInfo.setRecordCountPerPage(5);
		
		Map<String,Object> insertMap = new HashMap<String, Object>();
		insertMap.put("GOODS_NUM", GOODS_NUM);
		insertMap.put("START", paginationInfo.getFirstRecordIndex()+1);
		insertMap.put("END", paginationInfo.getLastRecordIndex());
		
		
		List<Map<String, Object>> reviewListMap = goodsService.getReviewListForDetail(insertMap);

		mav.addObject("reviewListMap", reviewListMap);
		
		if(reviewListMap.isEmpty()) {
			
		}else {
			int totalCount = ((BigDecimal)reviewListMap.get(0).get("TOTAL_COUNT")).intValue();
			paginationInfo.setTotalRecordCount(totalCount);
			mav.addObject("paginationInfo", paginationInfo);
			
		}
		
		
		
		
		
		
		
		
		mav.setViewName("goods/reviewList");
		return mav;
	}

}
