package com.ezen.ezenwood.goods.controller;

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

@Controller

public class GoodsController {
	
	@Resource(name = "GoodsService")
	GoodsService goodsService;
	
	
	@RequestMapping("/goods/{category}/{pageNum}")
	public ModelAndView goodsList(@PathVariable String category ,@PathVariable int pageNum ,HttpServletRequest request ) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("GOODS_CATEGORY", category);
		insertMap.put("START", "1");
		insertMap.put("END", "9");
		
		List<Map<String,Object>> goodsList = goodsService.goodsList(insertMap);
		
		mav.addObject("goodsList", goodsList);
		
		//insertMap.put("currentPageNum", pageNum);
		
		
		
		mav.setViewName("goods/list");
		
		return mav;
	}
	
	
	@RequestMapping("/goods")
	public ModelAndView goodsDetail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String goodsNum = request.getParameter("idx");
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("GOODS_NUM", goodsNum);
		
		Map<String, Object> GOODS_MAP =goodsService.goodsDetail(insertMap);
		
		insertMap.put("QNA_PARENT", goodsNum);
		
		List<Map<String,Object>> QNAListMap = goodsService.getQNAListForDetail(insertMap);
		mav.addObject("QNAListMap", QNAListMap);
		
		List<Map<String,Object>> reviewListMap = goodsService.getReviewListForDetail(insertMap);
		
		mav.addObject("reviewListMap", reviewListMap);
		
		
		
		mav.addObject("GOODS_MAP", GOODS_MAP);
		mav.setViewName("goods/detail");
		
		
		return mav;
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/goods/qna/write", method = RequestMethod.GET)
	public String qnaWriteForm(CommandMap commandMap, HttpServletRequest request, Model model) {
		//String writer = (String) request.getSession().getAttribute("MEMBER_NAME");
		String writer = "testKim";
		String QNA_PARENT = request.getParameter("GOODS_NUM");
		
		
		
		String GOODS_TITLE = goodsService.getGoodsTitle(QNA_PARENT);
		model.addAttribute("writer", writer);
		model.addAttribute("QNA_PARENT", QNA_PARENT);
		//model.addAttribute("IMAGE_PARENT", QNA_PARENT);
		model.addAttribute("GOODS_TITLE", GOODS_TITLE);
		//model.addAttribute("IMAGE_TABLENAMES_TABLENAME", "QNA");
		
		
		return "goods/qnaWrite";
	}
	
	@RequestMapping(value = "/goods/qna/write", method = RequestMethod.POST)
	public String qnaWrite(CommandMap commandMap, HttpServletRequest request, Model model) {
		//String MEMBER_NUM = (String) request.getSession().getAttribute("MEMBER_NUM");
		String MEMBER_NUM = "1";
		String QNA_PARENT = request.getParameter("QNA_PARENT");
		commandMap.put("QNA_WRITER", MEMBER_NUM);
		if(commandMap.get("QNA_SECREAT")==null) {
			commandMap.put("QNA_SECREAT", "N");
		}
		int checkNum =goodsService.insertQNA(commandMap.getMap(), request);
		if(checkNum==0) {
			
		}else {
			
		}
		return "redirect:/goods?idx="+QNA_PARENT;
	}
	
	@RequestMapping("/goods/qna")
	public ModelAndView qnaList() {
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("START", "1");
		insertMap.put("END", "9");
		
		List<Map<String,Object>> QNAListMap   =goodsService.QNAList(insertMap);
		
		mav.addObject("QNAListMap", QNAListMap);
		
		
		mav.setViewName("goods/qnaList");
		return mav;
	}
	
	@RequestMapping("/goods/qna/{qnanum}")
	public ModelAndView qnaDetail(@PathVariable String qnanum) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("QNA_NUM", qnanum);
		
		Map<String, Object> resultMap = goodsService.getQNADetail(insertMap);
		
		mav.addObject("QNAMap", resultMap);
		
		mav.setViewName("goods/qnaDetail");
		return mav;
	}
	
	
	
	
	@RequestMapping(value = "/goods/review/write" , method = RequestMethod.GET)
	public ModelAndView reviewWriteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String GOODS_NUM = request.getParameter("GOODS_NUM");
		
		String MEMBER_ID = (String) request.getSession().getAttribute("MEMBER_ID");
		
		String GOODS_TITLE =goodsService.getGoodsTitle(GOODS_NUM);
		
		String REVIEW_PARENT = GOODS_NUM;
		
		mav.addObject("GOODS_TITLE", GOODS_TITLE);
		mav.addObject("MEMBER_ID", MEMBER_ID);
		mav.addObject("REVIEW_PARENT", REVIEW_PARENT);
		
		
		
		mav.setViewName("goods/reviewWrite");
		return mav;
	}
	
	
	@RequestMapping(value = "/goods/review/write" , method = RequestMethod.POST)
	public ModelAndView reviewWrite(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		commandMap.put("MEMBER_ID", request.getSession().getAttribute("MEMBER_ID"));
		
		int checkNum =goodsService.insertReview(commandMap.getMap(), request);
		
		
		mav.setViewName("redirect:/goods?idx="+commandMap.get("REVIEW_PARENT"));
		return mav;
	}
	
	@RequestMapping("/goods/review/{REVIEW_NUM}")
	public ModelAndView reviewDetail(@PathVariable int REVIEW_NUM) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("REVIEW_NUM", REVIEW_NUM);
		
		Map<String,Object> resultMap = goodsService.getReviewDetail(insertMap);
		
		mav.addObject("reviewMap", resultMap);
		
		
		
		
		mav.setViewName("goods/reviewDetail");
		return mav;
	}
	
	
	
	
	
	
	
	

}
