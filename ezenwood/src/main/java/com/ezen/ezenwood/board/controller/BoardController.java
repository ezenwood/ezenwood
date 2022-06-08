package com.ezen.ezenwood.board.controller;

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
import com.ezen.ezenwood.board.service.BoardService;

@Controller

public class BoardController {
	
	@Resource(name="BoardService")
	BoardService boardService;
	

	@RequestMapping("/board/oto")
	public ModelAndView OTOList() {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("START", "1");
		insertMap.put("END", "15");
		
		List<Map<String, Object>> OTOListMap = boardService.OTOList(insertMap);
		
		mav.addObject("OTOListMap", OTOListMap);
		mav.setViewName("board/oto/otoBoard");
		return mav;
	}

	@RequestMapping("/board/oto/otoBoard/{otonum}")
	public ModelAndView OTODetail(@PathVariable String otonum) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("ONETOONE_NUM", otonum);
		
		Map<String, Object> resultMap = boardService.getOTODetail(insertMap);
		
		mav.addObject("OTOMap", resultMap);
		mav.setViewName("board/oto/otoDetail");
		return mav;
	}
	
	
	
	

}
