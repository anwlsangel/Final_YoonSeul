package com.kh.yoonsart.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.common.template.Pagination;
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
	    //System.out.println(rating);
	    
	    if(rating == 0) {
	    	
	    	session.setAttribute("alertMsg", "별점을 1개이상 등록해주세요!");
			mv.setViewName("redirect:/detail.co?cno="+ review.getConcertId() + "#reviews");
			
			return mv;
	    } else {
		    
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
	
	// 후기 삭제 (update)
	@GetMapping("delete.re")
	public String deleteReview(@RequestParam("reviewId") int rno, Review r, Model model, HttpSession session) {
		
		Review review = new Review();
		review.setConcertId(rno);
		//System.out.println(rno);
		//System.out.println(r.getReviewId());
		
		// model.addAttribute("r", r.getReviewId());
		//System.out.println(r.getReviewId());
	
		
		int result = reviewService.deleteReview(rno);
		//session.setAttribute("review", r);
		
		// System.out.println(rno);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "리뷰 삭제 성공!");
			//System.out.println("콘서트아이디 : ");
			//System.out.println(r.getConcertId());
			return "redirect:/detail.co?cno="+ r.getConcertId() + "#reviews";
		} else {
			
			model.addAttribute("errorMsg", "리뷰 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	// 후기 수정 
	@PostMapping("/update.re")
	public String updateReview(@RequestParam("reviewId") int reviewId,
			   				 @RequestParam("concertId") int concertId, 
			   				 String newReviewContent, Model model, HttpSession session) {
		
		System.out.println("update test");
		
		Review r = new Review();
		r.setReviewId(reviewId);
		r.setReviewContent(newReviewContent);
		int result = reviewService.updateReview(r);
		System.out.println("update test2");
		if(result > 0) {
			return "redirect:/detail.co?cno=" + concertId +"#review";
		} else {
			model.addAttribute("errorMsg", "리뷰 수정 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@PostMapping(value="list.rv", produces="application/json; charset=UTF-8")
	public JSONObject ajaxReviewList(int currentPage, int cno) throws IOException  {
		
        int listCount = reviewService.selectReviewCount(cno);
		int pageLimit = 10;
		int boardLimit = 5;
        
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Review> reviewList = reviewService.selectReviewList(cno, pi);
		//System.out.println(reviewList);
		JSONArray rList = new JSONArray();
		for (Review r : reviewList) {
			// replyList.add(er); <- 이렇게 VO 를 대놓고 넣으면 안됨
			JSONObject review = new JSONObject();
			review.put("reviewId", r.getReviewId());
			review.put("reviewContent", r.getReviewContent());
			review.put("reviewPoint", r.getReviewPoint());
			review.put("writeDate", r.getWriteDate());
			review.put("userId", r.getUserId());
			review.put("concertId", r.getConcertId());
			review.put("status", r.getStatus());
			
			rList.add(review);
		}
		
		JSONObject pageInfo = new JSONObject();
		pageInfo.put("listCount", listCount);
		pageInfo.put("currentPage", currentPage);
		pageInfo.put("pageLimit", pageLimit);
		pageInfo.put("boardLimit", boardLimit);
		pageInfo.put("maxPage", pi.getMaxPage());
		pageInfo.put("startPage", pi.getStartPage());
		pageInfo.put("endPage", pi.getEndPage());

		JSONObject result = new JSONObject();
		result.put("rList", rList);
		result.put("pageInfo", pageInfo);

		//System.out.println("reviewresut"+result);
		
		return result;
	}
	
	
	

}
