package com.kh.yoonsart.review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yoonsart.review.model.service.ReviewService;
import com.kh.yoonsart.review.model.vo.Review;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping("insertReview")
	public ModelAndView insertReview(@RequestParam("rating") int rating,
            				   @RequestParam("reviewContent") String reviewContent,
            				   @RequestParam("userId") String userId,
            				   @RequestParam("cno") int cno,
            				   HttpSession session,
            				   ModelAndView mv) {
		
		Review review = new Review();
		review.setConcertId(cno);
		review.setUserId(userId);
		review.setReviewPoint(rating);
	    review.setReviewContent(reviewContent);
	    
	    int result = reviewService.insertReview(review);
	    
	    if(result > 0) { // 성공
				
			session.setAttribute("alertMsg", "리뷰 등록 성공!");
			mv.setViewName("redirect:/detail.co?cno="+ review.getConcertId() + "#reviews");
				
		} else { // 실패
	
			mv.addObject("errorMsg", "등록 실패").setViewName("common/errorPage");
		}
	    
	    return mv;
		
	}

}
