package com.kh.yoonsart.admin;

import org.springframework.web.bind.annotation.GetMapping;

public class AdminController {
	
	@GetMapping("adminPage.ad")
	public String adminPage() {
		
		return "admin/adminPage";
	}	

}
