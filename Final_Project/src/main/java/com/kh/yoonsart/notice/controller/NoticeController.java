package com.kh.yoonsart.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.common.template.Pagination;
import com.kh.yoonsart.notice.model.service.NoticeService;
import com.kh.yoonsart.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("list.no")
	public String selectList(
			@RequestParam(value="cpage", defaultValue="1") int currentPage, String keyword,Model model) {
		
		int listCount=0;
		if(keyword!=null) {
			listCount = noticeService.selectSearchListCount(keyword);
		} else {
			listCount = noticeService.selectListCount();
		}
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		// PageInfo 객체 만들어내기
		PageInfo pi 
			= Pagination.getPageInfo(listCount, 
								 	 currentPage, 
								 	 pageLimit, 
								 	 boardLimit);
		
		// System.out.println(pi);
		
		// 게시글 목록 조회
		ArrayList<Notice> list = new ArrayList<>();
		if(keyword!=null) {
			list = noticeService.selectSearchList(pi, keyword);
		} else {
			list = noticeService.selectList(pi);
		}
		
		// 응답데이터 담기
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		// 응답페이지 포워딩
		return "notice/noticeListView";
	}
	
	@GetMapping("enrollForm.no")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		// 게시글 작성하기 페이지 포워딩
		// /WEB-INF/views/.jsp
		mv.setViewName("notice/noticeEnrollForm");
		
		return mv;
	}
	

	@PostMapping("insert.no")
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
			
			mv.setViewName("redirect:/list.no");
			
		} else { // 실패
			
			mv.addObject("errorMsg", "게시글 등록 실패")
			  .setViewName("common/errorPage");
			
		}
		
		return mv;
		
	}
	
	@GetMapping("detail.no")
	public ModelAndView selectNotice( int nno, int cpage, ModelAndView mv) {
		
		int result = noticeService.increaseCount(nno);
		System.out.println(nno);
		if(result > 0) {
			
			Notice n = noticeService.selectNotice(nno);
			System.out.println(n.getNoticeCount());
			mv.addObject("n", n)
			  .addObject("currentPage", cpage)
			  .setViewName("notice/noticeDetailView");
			
		} else { 
			
			mv.addObject("errorMsg", "게시글 상세조회 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@PostMapping("delete.no")
	public String deleteNotice(int nno,
							  String filePath,
							  Model model,
							  HttpSession session) {
		
		int result = noticeService.deleteNotice(nno);
		
		if(result > 0) { // 성공
			
			if(!filePath.equals("")) {
				
				String realPath = session.getServletContext()
										 .getRealPath(filePath);
				
				new File(realPath).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			return "redirect:/list.no";
			
		} else { 
			
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			
			return "common/errorPage";
		}
	}
	
	@PostMapping("updateForm.no")
	public String updateForm(int nno, int cpage, Model model) {
	
		Notice n = noticeService.selectNotice(nno);
		System.out.println(nno);
		model.addAttribute("n", n)
			 .addAttribute("currentPage", cpage);
		
		return "notice/noticeUpdateForm";
	}
	
	@PostMapping("update.no")
	public String updateNotice(Notice n,
							  int cpage,
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
			
			return "redirect:/list.no?cpage=" + cpage;
			
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










