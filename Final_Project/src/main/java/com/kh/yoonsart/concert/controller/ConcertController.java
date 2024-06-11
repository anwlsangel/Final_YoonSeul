package com.kh.yoonsart.concert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.concert.model.service.ConcertService;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.review.model.vo.Review;

@Controller
public class ConcertController {
	
	@Autowired
	private ConcertService concertService;
	
	@GetMapping("list.co")
	public String selectList(@RequestParam("category") String category, @RequestParam("sort") String sort, Model model) {
										
		ArrayList<Concert> list = concertService.selectList(category, sort);
		
		
		model.addAttribute("list", list);
			
		return "concert/ConcertListView";
		
	}
	
	@GetMapping("search.co")
	public String searchList(@RequestParam("keyword") String keyword,
	                       @RequestParam("category") String category,
	                       @RequestParam("sort") String sort,
	                       Model model) {
		
		ArrayList<Concert> list = concertService.searchList(keyword, category, sort);
		
		model.addAttribute("list", list);
						
		return "concert/ConcertListView";
		
	}
	
	@GetMapping("detail.co")
	public String concertDetail(@RequestParam("cno") int cno, Model model) {
		
		// 상세 조회
        Concert concert = concertService.concertDetail(cno);
        model.addAttribute("concert", concert);
        
        // Q&A 조회
        ArrayList<QNA> qnaList = concertService.selectQnaList(cno);
        
        // 후기 조회
        ArrayList<Review> rvList = concertService.selectReview(cno);
        
        // 페이징처리구문 추가 
        
        
        model.addAttribute("qnaList", qnaList);
        // System.out.println(qnaList);
        
        return "concert/ConcertDetailView"; // 상세보기 페이지 JSP 이름
    }
	

}
