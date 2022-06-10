package com.ezen.ezenwood.pay.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ezen.common.CommandMap;
import com.ezen.ezenwood.pay.service.PayService;

@Controller
@SessionAttributes("payInfo")
@RequestMapping("/pay")
public class PayController {
	
	
	@Resource(name = "PayService")
	PayService payService;
	
	
	

	@RequestMapping(value = "/step1", method = RequestMethod.POST)
	public String userPayForm(CommandMap commandMap, Model model, HttpServletRequest request) {
		
		//commandMap.put("MEMBER_ID", (String) request.getSession().getAttribute("MEMBER_ID"));
		
		
		
		Map<String, Object> result = payService.step1(commandMap.getMap());
		
		List<Map<String, Object>> payListMap = (List<Map<String, Object>>) result.get("payListMap");
		
		
		model.addAttribute("payInfo", result.get("payInfo"));
		model.addAttribute("payListMap", payListMap);
		
		
		return "/pay/step1";
	}
	
	
	@RequestMapping("/step2")
	public String userPayWrite(@ModelAttribute("payInfo") Map<String,Object> payInfo, HttpServletRequest request, Model model  ) {
		
		String MEMBER_ID = (String) request.getSession().getAttribute("MEMBER_ID");
		
		Map<String, Object> insertMap = new HashMap<String,Object>();
		insertMap.put("MEMBER_ID", MEMBER_ID);
		
		Map<String,Object> memberMap = payService.step2(insertMap);
		
		
		
		model.addAttribute("memberMap", memberMap);
		
		model.addAttribute("payInfo", payInfo);
		
		
		return "/pay/step2";
	}
	
	@RequestMapping(value = "/step3", method = RequestMethod.POST)
	public String userPayOk(CommandMap commandMap ,@ModelAttribute("payInfo") Map<String,Object> payInfo, HttpServletRequest request, Model model) {
		commandMap.put("payInfo", payInfo);
		commandMap.put("MEMBER_ID", request.getSession().getAttribute("MEMBER_ID"));
		
		Map<String,Object> resultMap = payService.step3(commandMap.getMap());
		
		
		
		
		payInfo.put("memberMap", commandMap.getMap());
		
		model.addAttribute("payInfo", payInfo);
		model.addAttribute("resultMap", resultMap);
		
		return "/pay/step3";
	}
	
}
