package com.kh.yoonsart.adminmain.adminQna.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.adminmain.adminQna.model.service.AdminQnaService;

@Controller
public class AdminQnaController {

	@Autowired
	private AdminQnaService adminqnaService;
	
	@GetMapping("AdQnaList.qa")
	public String AdQnaList(Model model) {
		
	ArrayList<QNA> list = adminqnaService.adQnaService();
		
		model.addAttribute("list", list);
		
		System.out.println(list);
		
		return "admin/adminQnaList";
		
	}
	 
}
