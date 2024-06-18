package com.kh.yoonsart.adminmain.adminReview.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.yoonsart.adminmain.adminReview.model.service.AdminReviewService;
import com.kh.yoonsart.review.model.vo.Review;

@Controller
public class AdminReviewController {

	@Autowired
	private AdminReviewService adminreviewService;
	
	@GetMapping("AdReviewList.qa")
	public String AdReviewList(Model model) {
		
		ArrayList<Review> list = adminreviewService.AdReviewList();
		
		model.addAttribute("list", list);
		
		//System.out.println(list);
		
		return "admin/adminReviewList";
	}
	
}
