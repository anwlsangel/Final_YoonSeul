package com.kh.yoonsart.concert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yoonsart.concert.model.service.ConcertService;
import com.kh.yoonsart.concert.model.vo.Concert;

@Controller
public class ConcertController {
	
	@Autowired
	private ConcertService concertService;
	
	@GetMapping("list.co")
	public String selectList(@RequestParam("category") String category, @RequestParam("sort") String sort, Model model) {
										
		ArrayList<Concert> list = concertService.selectList(category, sort);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
			
		return "concert/ConcertListView";
		
	}
	

}
