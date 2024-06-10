package com.kh.yoonsart.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.yoonsart.admin.model.service.AdminService;

public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 관리자페이지 요청 메소드 
	@GetMapping("adminPage.ad")
	public String adminPage() {
		
		return "admin/adminPage";
	}	

	
	
	
}
