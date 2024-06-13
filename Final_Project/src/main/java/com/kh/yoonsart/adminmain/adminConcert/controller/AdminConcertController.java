package com.kh.yoonsart.adminmain.adminConcert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.yoonsart.adminmain.adminConcert.model.service.AdminConcertService;
import com.kh.yoonsart.adminmain.adminConcert.model.vo.AdminConcert;	

@Controller
public class AdminConcertController {
	
	@Autowired
	private AdminConcertService adminConcertService;
	
	@GetMapping("AdConcertList.co")
	public String SelectAdConcert(Model model) {

		ArrayList<AdminConcert> list = adminConcertService.adSelectList();
		
		model.addAttribute("list", list);
		
		return "admin/AdminConcertList";
		
	}
	

}
