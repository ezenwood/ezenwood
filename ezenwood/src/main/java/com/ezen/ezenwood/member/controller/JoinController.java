package com.ezen.ezenwood.member.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.ezenwood.member.MemberDTO;
import com.ezen.ezenwood.member.service.JoinService;

@Controller
@RequestMapping("/member")
public class JoinController {
	
	@Resource(name ="JoinService")
	JoinService joinService;
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET )
	public String joinForm(Model model) {
		model.addAttribute("test", "test");
		
		return "member/join/signUp";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST )
	public String join(MemberDTO memberDto) {
		System.out.println(memberDto.getMEMBER_ADD1());
		int a =joinService.join(memberDto);
		
		
		
		return "member/join/signUp";
	}
	
	@RequestMapping("/idcheck")
	public void idCheck(HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		String id = request.getParameter("id");
		System.out.println("getParameter: "+id);
		
		int checkNum = joinService.idCheck(id);
		System.out.println(checkNum);
		response.getWriter().print(checkNum);
	}


}
