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
	public String selectList(Model model) {
		
		ArrayList<Concert> list = concertService.selectList();
		
		System.out.println(list);
		
		// model.addAttribute("list", list);
		
		return "concert/ConcertListView";
		
	}
	
	@GetMapping("/filterConcerts")
    @ResponseBody
    public ArrayList<Concert> filterSelectList(@RequestParam("category") String category) {
        
		System.out.println(concertService.filterSelectList(category));
		
		return concertService.filterSelectList(category);
        
    }
	
	@GetMapping("/selectListAll")
	@ResponseBody
	public ArrayList<Concert> selectListAll() {
		
		return concertService.selectListAll();
	}

}
