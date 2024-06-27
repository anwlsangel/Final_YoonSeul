package com.kh.yoonsart.adminmain.adminReview.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	// 리뷰 상세 조회
	@GetMapping("AdReUpdateForm.re")
	public String adreviewDetail(@RequestParam("rno") int rno, Model model) {
		
		Review r = adminreviewService.adreviewDetail(rno);
		//System.out.println(r);
		
		model.addAttribute("r", r);
		// System.out.println(q);
		
		return "admin/adminReviewDetail";
	}
	
	// 삭제
	@PostMapping("/AdDelete.re")
	public ModelAndView AdReviewDelete(Review r,
						               ModelAndView mv,
						               HttpSession session,
						               int number) {
		System.out.println(number);
		//System.out.println(r.getStatus());		
		System.out.println(r.getReviewId());
		
		System.out.println("컨트롤러");
		int result = 0;
		
		if(number == 2) {
		
			result = adminreviewService.AdReviewDelete(r);
			if(result > 0) { // 성공
				
				session.setAttribute("alertMsg", "후기 삭제 성공!");
				mv.setViewName("redirect:/AdReviewList.qa");
				
			} else { // 실패
		
				mv.addObject("errorMsg", "등록 실패").setViewName("common/errorPage");
			}
		} else {
			
			result = adminreviewService.AdReviewUpdate(r);
			if(result > 0) { // 성공
				
				session.setAttribute("alertMsg", "후기 활성화 성공!");
				mv.setViewName("redirect:/AdReviewList.qa");
				
			} else { // 실패
		
				mv.addObject("errorMsg", "등록 실패").setViewName("common/errorPage");
			}
		}
		
		
		
		return mv;
		
	}
	
	
}
