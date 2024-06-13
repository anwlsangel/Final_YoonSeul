package com.kh.yoonsart.adminmain.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	
	// @Autowired
	// private AdminService adminService;
	
	// 관리자페이지 요청 메소드 
	@GetMapping("adminPage.ad")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	
	
	
}
