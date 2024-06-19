package com.kh.yoonsart.concert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.concert.model.service.ConcertService;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.concert.model.vo.ConcertDate;
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
	// 공연 좋아요 갯수 표시용 로직 추가 - 0618 무진
	 @GetMapping("detail.co")
	    public String concertDetail(@RequestParam("cno") int cno, 
	                                @RequestParam(value="cpage", defaultValue="1") int currentPage, 
	                                Model model) {      
	        // 상세 조회
	        Concert concert = concertService.concertDetail(cno);
	        model.addAttribute("concert", concert); 

	        // 콘서트장 상태값 조회용 
	        int holeStatus = concertService.selectHoleStatus(cno);	        
	        
	        // Q&A 조회
	        ArrayList<QNA> qnaList = concertService.selectQnaList(cno);

	        // Q&A 갯수 조회 
	        int qnaCount = concertService.selectQnaCount(cno);
	        
	        // 후기 조회
	        ArrayList<Review> rvList = concertService.selectReview(cno);
	        //System.out.println("ㄼ:"+ rvList);
	        // 후기 갯수 조회
	        int reviewCount = concertService.selectCount(cno);
	        
	        // 별점 평균 조회
	        int starCount = concertService.selectStar(cno);
	        
	        // 좋아요 수 조회
	        int likeCount = concertService.selectWishlistCount(cno);
	        
	        // 잔여 티켓 조회
	        int seatCount = concertService.selectSeatCount(cno);
	        
	        ArrayList<ConcertDate> DateList = concertService.selectDateList(cno);
	        
	        
	        model.addAttribute("rvList", rvList);
	        model.addAttribute("qnaList", qnaList);
	        model.addAttribute("cno",cno);
	        model.addAttribute("reviewCount",reviewCount);
	        model.addAttribute("qnaCount", qnaCount);
	        model.addAttribute("starCount", starCount);
	        model.addAttribute("likeCount", likeCount); // 좋아요 수 추가
	        model.addAttribute("holeStatus", holeStatus);
	        model.addAttribute("seatCount", seatCount);
	        model.addAttribute("DateList", DateList);
	        // System.out.println(qnaList);
	        
	        return "concert/ConcertDetailView"; // 상세보기 페이지 JSP 이름
	    }
	
	@GetMapping("seat.co")
	public String ConcertSeatReserve() {
				
		return "concert/ConcertSeatReserve";
		
	}
	
	@PostMapping(value = "/wishlistadd", produces = "text/html; charset=UTF-8")
	    @ResponseBody
	    public String addWishlist(@RequestParam("userId") String userId, @RequestParam("concertId") int concertId) {
	        int result = concertService.addWishlist(userId, concertId);
	        if (result > 0) {
	            return "관심 공연에 추가되었습니다.";
	        } else {
	            return "관심 공연 추가에 실패했습니다.";
	        }
	    }

	    @PostMapping(value ="/wishlistremove", produces = "text/html; charset=UTF-8")
	    @ResponseBody
	    public String removeWishlist(@RequestParam("userId") String userId, @RequestParam("concertId") int concertId) {
	        int result = concertService.removeWishlist(userId, concertId);
	        if (result > 0) {
	            return "관심 공연에서 삭제되었습니다.";
	        } else {
	            return "관심 공연 삭제에 실패했습니다.";
	        }
	    }

}
