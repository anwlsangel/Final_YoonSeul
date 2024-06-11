package com.kh.yoonsart.QNA.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yoonsart.QNA.model.service.QNAService;
import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.common.template.Pagination;

@Controller
public class QNAController {

	@Autowired
	private QNAService qnaService;
	
	@GetMapping("list.qa")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = qnaService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<QNA> list = qnaService.selectList(pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "concert/concertDetailView.co#text";
		// > 공연 상세보기 페이지 탭에 있음 
	}
	
	
	@GetMapping("enrollform.qa")
	public String enrollForm(ModelAndView mv) {
		return "Q&A/q&aEnrollForm";
	}
	
	@PostMapping(value="insert.qa")
	public ModelAndView insertBoard(QNA q, HttpSession session, ModelAndView mv) {
		
		System.out.println(q);
		
		int result = qnaService.insertQNA(q);
		
		// 결과에 따른 응답페이지 처리 
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "문의글 등록 성공!");
			mv.setViewName("redirect:/concertDetailView.co#text");
			
		} else { // 실패

			mv.addObject("errorMsg", "등록 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@GetMapping("detail.qa")
	public ModelAndView selectBoard(int qno, ModelAndView mv) {
		
		 System.out.println(qno);
		
//		// 1. 해당 게시글 조회수 증가용 서비스 호출 및 결과 받기 
//		int result = boardService.increaseCount(bno);
//		
//		if(result > 0) { // 조회수 증가 성공
//			
//			// 게시글 상세조회 페이지에서 보여질 해당 게시글 정보를 조회해와야함
//			Board b = boardService.selectBoard(bno);
//			
//			// 조회된 데이터를 담아서 응답페이지로 포워딩
//			// /WEB-INF/views/board/boardDetailView.jsp
//			mv.addObject("b", b).setViewName("board/boardDetailView");
//			
//		} else { // 조회수 증가 실패
//			
//			// 에러 문구를 담아서 에러문구로 포워딩
//			mv.addObject("errorMsg", "게시글 상세 조회 실패").setViewName("common/errorPage");
//		}
//		return mv;
	}
	
	
	
	
}
