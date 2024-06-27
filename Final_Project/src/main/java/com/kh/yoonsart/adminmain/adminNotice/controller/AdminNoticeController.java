package com.kh.yoonsart.adminmain.adminNotice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yoonsart.notice.model.service.NoticeService;
import com.kh.yoonsart.notice.model.vo.Notice;

@Controller
public class AdminNoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("list.adno")
	public String adNoticeList(Model model) {
		
		ArrayList<Notice> list = noticeService.adNoticeList();
		
		model.addAttribute("list", list);
		
		//System.out.println(list);
		
		return "admin/adminNoticeList";
	}
	
	@GetMapping("enrollForm.adno")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		// 게시글 작성하기 페이지 포워딩
		// /WEB-INF/views/.jsp
		mv.setViewName("admin/adminNoticeEnrollForm");
		
		return mv;
	}
	

	@PostMapping("insert.adno")
	public ModelAndView insertNotice(Notice n, 
									MultipartFile upfile,
									HttpSession session,
									ModelAndView mv) {

		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String fileName = upfile.getOriginalFilename();
			String changeName = savePath(upfile, session);
			
			n.setNoticeImg("resources/uploadFiles/" + changeName);
			n.setNoticeImgName(fileName);
			
		}
		
		int result = noticeService.insertNotice(n);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
			mv.setViewName("redirect:/list.adno");
			
		} else { // 실패
			
			mv.addObject("errorMsg", "게시글 등록 실패")
			  .setViewName("common/errorPage");
			
		}
		
		return mv;
		
	}
	
	
	@PostMapping("delete.adno")
	public String deleteNotice(Notice n,
							  String filePath,
							  Model model,
							  HttpSession session) {
		
		int result = noticeService.deleteNotice(n.getNoticeNo());
		
		if(result > 0) { // 성공
			
			model.addAttribute("nno", n.getNoticeNo());
			session.setAttribute("alertMsg", "게시글이 비활성화 되었습니다.");
			
			return "redirect:/updateForm.adno?nno=" + n.getNoticeNo();
			
		} else { 
			
			model.addAttribute("errorMsg", "게시글 비활성화 실패");
			
			return "common/errorPage";
		}
	}
	@PostMapping("restore.adno")
	public ModelAndView restoreNotice(Notice n,
			String filePath,
			HttpSession session,
			ModelAndView mv) {

		int result = noticeService.restoreNotice(n.getNoticeNo());
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "게시글이 활성화 되었습니다.");
			mv.setViewName("redirect:/updateForm.adno?nno=" + n.getNoticeNo());		
			
		} else { 
			
			mv.addObject("errorMsg", "게시글 활성화 실패").setViewName("common/errorPage");			
		}
		
		return mv;
	}
	
	
	@GetMapping("updateForm.adno")
	public String updateForm(int nno, @RequestParam(value = "cpage", defaultValue = "1") int cpage, Model model) {
	
		Notice n = noticeService.adSelectNotice(nno);
		System.out.println(n);
		model.addAttribute("n", n)
			 .addAttribute("currentPage", cpage);
		System.out.println(n.getNoticeNo());
		return "admin/adminNoticeUpdateForm";
	}
	
	@PostMapping("update.adno")
	public String updateNotice(Notice n,
							  MultipartFile reupfile,
							  HttpSession session,
							  Model model) {
		System.out.println(n);
		if(!reupfile.getOriginalFilename().equals("")) {
			

			if(n.getNoticeImg() != null) {

				
				String realPath 
						= session.getServletContext()
								 .getRealPath(n.getNoticeImg());
				
				new File(realPath).delete();
			}
			String fileName = reupfile.getOriginalFilename();
			String changeName = savePath(reupfile, session);
			
			n.setNoticeImgName(fileName);
			n.setNoticeImg("resources/uploadFiles/" + changeName);
			
		} else {
			if(n.getNoticeImgName()==null ) {

				
				String realPath 
						= session.getServletContext()
								 .getRealPath(n.getNoticeImg());
				
				new File(realPath).delete();
				
				n.setNoticeImg(null);
			}
		}
		
		int result = noticeService.updateNotice(n);
		if(result > 0) { 
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			
			return "redirect:/updateForm.adno?nno="+n.getNoticeNo();
			
		} else { 
			
			model.addAttribute("errorMsg", "게시글 수정 실패");
			
			return "common/errorPage";
		}
	}
	
	
	// ---------------- 일반메소드 ---------------------
	
	public String savePath(MultipartFile upfile,
						   HttpSession session) {
		
		String originName = upfile.getOriginalFilename(); 
		
		String currentTime 
				= new SimpleDateFormat("yyyyMMddHHmmss")
									.format(new Date());
										
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
									
		String ext 
			= originName.substring(originName.lastIndexOf("."));
									
		String changeName = currentTime + ranNum + ext;
		
		String savePath
				= session.getServletContext()
						 .getRealPath("/resources/uploadFiles/");
		
		try {
			
			upfile.transferTo(new File(savePath + changeName));
		
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	
}










