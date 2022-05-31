package com.ezen.ezenwood.goods.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.common.CommandMap;
import com.ezen.ezenwood.goods.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Resource(name = "GoodsService")
	GoodsService goodsService;
	
	@RequestMapping(value = "/qna/write", method = RequestMethod.GET)
	public String qnaWriteForm(CommandMap commandMap, HttpServletRequest request, Model model) {
		//String writer = (String) request.getSession().getAttribute("MEMBER_NAME");
		String writer = "testKim";
		String QNA_PARENT = request.getParameter("GOODS_NUM");
		String GOODS_TITLE = "GOODS_TITLE TEST";
		model.addAttribute("writer", writer);
		model.addAttribute("QNA_PARENT", QNA_PARENT);
		//model.addAttribute("IMAGE_PARENT", QNA_PARENT);
		model.addAttribute("GOODS_TITLE", GOODS_TITLE);
		//model.addAttribute("IMAGE_TABLENAMES_TABLENAME", "QNA");
		
		
		return "goods/qnaWrite";
	}
	
	@RequestMapping(value = "/qna/write", method = RequestMethod.POST)
	public String qnaWrite(CommandMap commandMap, HttpServletRequest request, Model model) {
		//String MEMBER_NUM = (String) request.getSession().getAttribute("MEMBER_NUM");
		String MEMBER_NUM = "1";
		commandMap.put("QNA_WRITER", MEMBER_NUM);
		if(commandMap.get("QNA_SECREAT")==null) {
			commandMap.put("QNA_SECREAT", "N");
		}
		int checkNum =goodsService.insertQNA(commandMap.getMap(), request);
		if(checkNum==0) {
			
		}else {
			
		}
		return "goods/qnaWrite";
	}
	
	@RequestMapping("/qna")
	public String qnaList() {
		
		return "goods/qnaList";
	}
	
	@RequestMapping("/qna/{qnanum}")
	public String qnaDetail() {
		
		return "goods/qnaDetail";
	}

}
