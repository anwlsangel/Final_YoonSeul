package com.kh.yoonsart.adminmain.adminQna.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.adminmain.adminQna.model.service.AdminQnaService;
import com.kh.yoonsart.concert.model.vo.Concert;

@Controller
public class AdminQnaController {

	@Autowired
	private AdminQnaService adminqnaService;
	
	@GetMapping("AdQnaList.qa")
	public String AdQnaList(Model model) {
		
		ArrayList<QNA> list = adminqnaService.adQnaService();
		
		model.addAttribute("list", list);
		
		// System.out.println(list);
		
		return "admin/adminQnaList";
	}
	
	@GetMapping("AdinsertAnswer.qa")
	public String adqnaDetail(@RequestParam("qno") int qno, Model model) {
		
		QNA q = adminqnaService.adqnaDetail(qno);
		
		model.addAttribute("q", q);
		// System.out.println(q);
		
		return "admin/adminQnaDetail";
		
	}
	
	@PostMapping("AdupdateAnswer.qa")
	public ModelAndView AdupdateAnswer(QNA q, Model model, ModelAndView mv, HttpSession session) {
						
		int result = adminqnaService.AdupdateAnswer(q);
		
		// System.out.println(result);
								
		if(result > 0) { // 성공
					
			session.setAttribute("alertMsg", "답변 등록 성공!");
			mv.setViewName("redirect:/AdinsertAnswer.qa?qno="+q.getQnaId());
			
		} else { // 실패
	
			mv.addObject("errorMsg", "등록 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	
}
