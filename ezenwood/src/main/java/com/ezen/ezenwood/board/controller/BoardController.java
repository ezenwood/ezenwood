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


	//OTO
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

	@RequestMapping(value = "/board/oto/otoWrite", method = RequestMethod.GET)
	public String otoWriteForm(CommandMap commandMap, HttpServletRequest request, Model model) {
		String writer = (String) request.getSession().getAttribute("MEMBER_ID");
		
		model.addAttribute("writer", writer);

		return "board/oto/otoWrite";
	}

	@RequestMapping(value = "/board/oto/otoWrite", method = RequestMethod.POST)
	public String otoWrite(CommandMap commandMap, HttpServletRequest request, Model model) {
		String MEMBER_NUM = (String) request.getSession().getAttribute("MEMBER_NUM");
	
		commandMap.put("QNA_WRITER", MEMBER_NUM);

		int checkNum = boardService.insertOTO(commandMap.getMap(), request);
		if (checkNum == 0) {

		} else {

		}
		return "redirect:/board/oto?idx=";
	}


	//FQ
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


}
