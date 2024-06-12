package com.kh.yoonsart.QNA.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView enrollForm(ModelAndView mv,String cno) {
		mv.addObject("cno", cno);
		mv.setViewName("Q&A/q&aEnrollForm");
		return mv;
	}
	
	@PostMapping(value="insert.qa")
	public ModelAndView insertBoard(QNA q, HttpSession session, ModelAndView mv) {
		
		int result = qnaService.insertQNA(q);
		
		// 결과에 따른 응답페이지 처리 
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "문의글 등록 성공!");
			mv.setViewName("redirect:/detail.co?cno="+ q.getConcertId() + "#text");
			
		} else { // 실패

			mv.addObject("errorMsg", "등록 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@GetMapping("detail.qa")
	public ModelAndView selectQNA(@RequestParam("qno") int qno, ModelAndView mv) {
		
		// System.out.println(qno);
		
		QNA q = qnaService.selecteQNA(qno);
		// System.out.println(q);
		mv.addObject("q", q).setViewName("Q&A/q&aDetailView") ;
	
		return mv;
	}
	
	// 게시글 삭제 
	@GetMapping("delete.qa")
	public String deleteQNA(@RequestParam("qno") int qno, QNA q, Model model, HttpSession session) {
		
		// System.out.println("확인1 : " + qno);
		
		 int result = qnaService.deleteQNA(qno);
		 
		 if(result > 0) {
			 
			 // System.out.println("확인2 : " +  qno);
			 
			 session.setAttribute("alertMsg", "문의글 삭제 성공!");
			 //model.addAttribute("alertMsg", "문의글 삭제 성공!");
			 // System.out.println(q.getConcertId());
			 return "redirect:/detail.co?cno="+ q.getConcertId() +"#text";
			 // > q.getConcertId() 값 가져와서 redirect 완성시켜야함
			 
		 } else { // 실패
				
			// 에러문구 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "문의글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@GetMapping("updateForm.qa")
	public ModelAndView updateForm(@RequestParam("qno") int qno, Model model, ModelAndView mv) {

		// System.out.println(qno);
		
		// 게시글 한건 조회 
		QNA q = qnaService.selecteQNA(qno);
		
		model.addAttribute("q", q);
		mv.setViewName("Q&A/q&aUpdateForm");
		return mv;
	}
	
	@PostMapping("update.qa")
	public String updateQNA(QNA q, HttpSession session, Model model) {
		
		System.out.println(q);
		return "";
	}
	
}
