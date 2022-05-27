package com.ezen.ezenwood.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
//	@RequestMapping("/")
//	public String index() {
//		return "index";
//	}
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/about")
	public String about() {
		return "common/about";
	}
	@RequestMapping("/cart")
	public String cart() {
		
		//모델 추가
		return "common/cart";
	}
	

}
