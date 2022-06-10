package com.ezen.ezenwood.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.ezenwood.admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource(name="AdminService")
	AdminService adminService;
	
	@RequestMapping("")
	public String admin() {
		return "admin/admin";
	}
}
