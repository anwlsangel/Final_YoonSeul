package com.kh.yoonsart.concert.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.concert.model.service.ConcertService;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.concert.model.vo.ConcertDate;
import com.kh.yoonsart.concert.model.vo.SeatInfo;
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
	              
	        
	        model.addAttribute("rvList", rvList);
	        model.addAttribute("qnaList", qnaList);
	        model.addAttribute("cno",cno);
	        model.addAttribute("reviewCount",reviewCount);
	        model.addAttribute("qnaCount", qnaCount);
	        model.addAttribute("starCount", starCount);
	        model.addAttribute("likeCount", likeCount); // 좋아요 수 추가
	        model.addAttribute("holeStatus", holeStatus);
	        model.addAttribute("seatCount", seatCount);
	        // System.out.println(qnaList);
	        
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-d HH:mm");
			LocalDateTime startDate = LocalDateTime.parse(concert.getFullDate(), formatter);
			LocalDateTime nowDate = LocalDateTime.now();
			HashMap<String, String> dataBox = new HashMap<String, String>();
			dataBox.put("cno", ""+cno);
			ArrayList<String> concertDays;
			if(nowDate.isBefore(startDate)) {
				dataBox.put("date",concert.getFullDate());			
			}else {
				dataBox.put("date",nowDate.format(formatter));
			}
			
			concertDays = concertService.getConcertDays(dataBox);
			System.out.println(concertDays);
			model.addAttribute("firstDay",dataBox.get("date"));
			model.addAttribute("concertDays",concertDays);
			model.addAttribute("totalTicket",concertService.getHoleSeatCount(concert.getHoleName()));
	        
	        if(concert.getHoleName().equals("별빛홀")) {
	        	
	        	return "concert/ConcertDetailViewSeat";
	        }
	        return "concert/ConcertDetailViewStanding"; // 상세보기 페이지 JSP 이름
	    }
	
		@GetMapping("seat.co")
		public String ConcertSeatReserve(int cno, Model m) {
			Concert concert = concertService.concertDetail(cno);
			m.addAttribute("Concert",concert);
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-d HH:mm");
			LocalDateTime startDate = LocalDateTime.parse(concert.getFullDate(), formatter);
			LocalDateTime nowDate = LocalDateTime.now();
			HashMap<String, String> dataBox = new HashMap<String, String>();
			dataBox.put("cno", ""+cno);
			ArrayList<String> concertDays;
			System.out.println(nowDate);
			System.out.println(startDate);
			if(nowDate.isBefore(startDate)) {
				dataBox.put("date",concert.getFullDate());			
			}else {
				dataBox.put("date",nowDate.format(formatter));
			}
			
			concertDays = concertService.getConcertDays(dataBox);
			System.out.println(concertDays);
			m.addAttribute("firstDay",dataBox.get("date"));
			m.addAttribute("concertDays",concertDays);
			m.addAttribute("totalTicket",concertService.getHoleSeatCount(concert.getHoleName()));
			if(concert.getHoleName().equals("별빛홀")) {
				return "concert/ConcertDetailViewSeat";	
			}else {
				return "concert/ConcertDetailViewSeat";
			}
		}
		@RequestMapping(value="getMonthScheduleWithCno", produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String getDaysAjax(String cno, String dateString) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-d HH:mm");
			LocalDateTime startDate = LocalDateTime.parse(dateString, formatter);
			LocalDateTime nowDate = LocalDateTime.now();
			ArrayList<String> concertDays;
			HashMap<String, String> dataBox = new HashMap<String, String>();
			dataBox.put("cno", cno);
			if(nowDate.isBefore(startDate)) {
				dataBox.put("date",startDate.format(formatter));			
			}else {
				dataBox.put("date",nowDate.format(formatter));
			}		
			concertDays = concertService.getConcertDays(dataBox);
			return new Gson().toJson(concertDays);
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
	    @GetMapping(value = "isInWishlist", produces = "application/json; charset=UTF-8")
	    @ResponseBody
	    public boolean isInWishlist(@RequestParam("userId") String userId, @RequestParam("concertId") int concertId) {
	    	System.out.println(concertService.isInWishlist(userId, concertId));
	        return concertService.isInWishlist(userId, concertId);
	    }
	    
	    @GetMapping("date.co")
	    @ResponseBody
	    public ArrayList<ConcertDate> selectDateList(@RequestParam("dateString") String dateString, @RequestParam("cno") int cno) {
	        // dateString 형식을 LocalDate로 변환
	        ArrayList<ConcertDate> DateList = concertService.selectDateList(cno, dateString);	        
        
	        return DateList;
	    }

	    @ResponseBody
	    @GetMapping(value="mainTopList.co", produces="application/json; charset=UTF-8")
	    public String selectMainTopList() {
	    	
	    	ArrayList<Concert> mainTopList = concertService.selectMainTopList();	    	
	    	
	    	return new Gson().toJson(mainTopList);
	    	
	    }
	    
	    @ResponseBody
	    @GetMapping(value="selectTopConcerts.co", produces="application/json; charset=UTF-8")
	    public String selectTopConcerts(@RequestParam("category") String category) {
	    	
	    	ArrayList<Concert> topConcertList = concertService.selectTopConcerts(category);	    	
	    	
	    	return new Gson().toJson(topConcertList);
	    }
	    
	    @ResponseBody
	    @GetMapping(value="selectOpenConcerts.co", produces="application/json; charset=UTF-8")
	    public String selectOpenConcerts() {
	    	
	    	ArrayList<Concert> openConcertList = concertService.selectOpenConcerts();	    	
	    	
	    	return new Gson().toJson(openConcertList);
	    }
	    
	    @RequestMapping("getSeatInfo")
	    @ResponseBody
	    public ArrayList<SeatInfo> getSeatInfo(String id) {
	    	ArrayList<SeatInfo> list = concertService.getSeatInfo(id);
	    	return list;
	    }
	    
	    
}
