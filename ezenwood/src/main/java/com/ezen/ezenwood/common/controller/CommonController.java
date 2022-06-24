package com.ezen.ezenwood.common.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.ezenwood.common.service.CommonService;

@Controller
public class CommonController {
	
//	@RequestMapping("/")
//	public String index() {
//		return "index";
//	}
	
	@Resource(name = "commonService")
	CommonService commonService;
	
	
	
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/about")
	public String about() {
		return "common/about";
	}
	
	
	
	
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartList(Model model,HttpServletRequest request) {
		
		List<Map<String,Object>> result =commonService.cartList((String)request.getSession().getAttribute("MEMBER_ID"));
		
		model.addAttribute("cartListMap", result);
		
		//모델 추가
		return "common/cart";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public void insertCart(@RequestBody HashMap<String, Object> map , HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		map.put("MEMBER_ID", request.getSession().getAttribute("MEMBER_ID"));
		map.put("BASKET_GOODS_OPTION", "dsadsa");
		
		String MEMBER_NUM = (String) request.getSession().getAttribute("MEMBER_NUM");
		if(MEMBER_NUM==null||MEMBER_NUM.equals("")||MEMBER_NUM.isEmpty()) {
			response.getWriter().print(0);
			return;
		}
		
		int checkNum = commonService.insertCart(map);
		
		
		response.getWriter().print(checkNum);
		
		
		
	}
	
	
	@RequestMapping(value = "/cartDelete" , method = RequestMethod.POST)
	public void deleteCart(@RequestBody HashMap<String, Object> map, HttpServletResponse response, HttpServletRequest request ) throws IOException {
		
		String cartDeleteList = (String) map.get("cartDeleteList");
		String[] deleteArray = cartDeleteList.split(",");
		
		Map<String, Object> insertMap = new HashMap<String,Object>();
		
		insertMap.put("deleteArray", deleteArray);
		insertMap.put("MEMBER_ID", request.getSession().getAttribute("MEMBER_ID"));
		
		boolean check = commonService.deleteCart(insertMap);
		
		if(check) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("1");
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	

}
