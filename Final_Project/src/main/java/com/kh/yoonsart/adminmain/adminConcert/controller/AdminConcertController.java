package com.kh.yoonsart.adminmain.adminConcert.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yoonsart.adminmain.adminConcert.model.service.AdminConcertService;
import com.kh.yoonsart.concert.model.vo.Concert;	

@Controller
public class AdminConcertController {
	
	@Autowired
	private AdminConcertService adminConcertService;
	
	@GetMapping("AdConcertList.co")
	public String SelectAdConcert(Model model) {

		ArrayList<Concert> list = adminConcertService.adSelectList();
		
		model.addAttribute("list", list);
		
		return "admin/AdminConcertList";
		
	}
	
	@GetMapping("AdupdateConcertForm.co")
	public String updateConcertForm(@RequestParam("cno") int cno, Model model) {
		
		Concert c = adminConcertService.adConcertDetail(cno);
		
		
		model.addAttribute("c", c);
		
		return "admin/AdminConcertDetail";
		
	}
	
	@PostMapping("AdConcertUpdate.co")
	public ModelAndView AdminConcertUpdate(Concert c, Model model, ModelAndView mv, HttpSession session) {
						
		int result = adminConcertService.adUpdateConcert(c);
		
		// System.out.println(result);
								
		if(result > 0) { // 성공
					
			session.setAttribute("alertMsg", "공연 정보 수정 성공!");
			mv.setViewName("redirect:/AdupdateConcertForm.co?cno="+c.getConcertId());
			
		} else { // 실패
	
			mv.addObject("errorMsg", "등록 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	

}
