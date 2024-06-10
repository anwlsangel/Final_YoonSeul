package com.kh.yoonsart.concert.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.yoonsart.concert.model.service.ConcertService;

@Controller
public class ConcertController {
	
	@GetMapping("list.co")
	public String selectList(Model model) {
		
		return "concert/ConcertListView";
		
	}

}
