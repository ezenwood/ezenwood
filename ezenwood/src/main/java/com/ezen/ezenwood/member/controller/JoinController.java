package com.ezen.ezenwood.member.controller;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		model.addAttribute("signup", "");
		
		return "member/join/signUp";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST )
	public String join(@Valid @ModelAttribute("memberDto") MemberDTO  memberDto, Errors errors) {
		System.out.println("dsadsa@@@@@@@@@@@@@");
		
		ResourceBundle resource = ResourceBundle.getBundle("Message.error");
		System.out.println("dsadsa@@@@@@@@@@@@@");
		
		if(errors.hasErrors()) {
			System.out.println("ererererererer");
			return "member/join/signUp";
		}
		
		
		int checkNum =joinService.join(memberDto);
		
		//checkNum == 1 success
		if(checkNum==1) {
			return "redirect:/member/success";
		}else {
			//model.addAttribute("signup", "fail");
			return "member/join/signUp";
		}
		
		
	}
	
	
	
	
	
	
	@RequestMapping("/idcheck")
	public void idCheck(HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		String id = request.getParameter("id");
		System.out.println("getParameter: "+id);
		
		int checkNum = joinService.idCheck(id);
		System.out.println(checkNum);
		response.getWriter().print(checkNum);
	}
	
	@RequestMapping("/success")
	public String success() {
		return "/member/join/success";
	}


}
