package com.kh.yoonsart.lostfind.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.common.template.Pagination;
import com.kh.yoonsart.lostfind.model.service.LostfindService;
import com.kh.yoonsart.lostfind.model.vo.LostImg;
import com.kh.yoonsart.lostfind.model.vo.Lostfind;

@Controller
public class LostfindController {

	@Autowired
	private LostfindService lostfindService;
	
	@GetMapping("list.lo")
	public String selectList(
			@RequestParam(value="cpage", defaultValue="1") int currentPage, String keyword, Model model) {
		int listCount=0;
		if(keyword!=null) {
			listCount = lostfindService.selectSearchListCount(keyword);
		} else {
			listCount = lostfindService.selectListCount();
		}
		int pageLimit = 5;
		int boardLimit = 5;
		
		
		// PageInfo 객체 만들어내기
		PageInfo pi 
			= Pagination.getPageInfo(listCount, 
								 	 currentPage, 
								 	 pageLimit, 
								 	 boardLimit);
		
		// System.out.println(pi);
		
		// 게시글 목록 조회
		ArrayList<Lostfind> list = new ArrayList<>();
		if(keyword!=null) {
			list = lostfindService.selectSearchList(pi, keyword);
		} else {
			list = lostfindService.selectList(pi);
		}
		
		// 응답데이터 담기
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		// 응답페이지 포워딩
		return "lostfind/lostfindListView";
	}
	
	@GetMapping("enrollForm.lo")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		// 게시글 작성하기 페이지 포워딩
		// /WEB-INF/views/.jsp
		mv.setViewName("lostfind/lostfindEnrollForm");
		
		return mv;
	}
	

	@PostMapping("insert.lost")
	public ModelAndView insertLostfind(Lostfind l,
									LostImg li,
									MultipartFile[] upfiles,
									HttpSession session,
									ModelAndView mv) {
		
		int result = lostfindService.insertLostfind(l);
		ArrayList<String> list = new ArrayList<>();
		if(result > 0) { 
			
			int lno = lostfindService.selectUpLostNo();
			
			if(upfiles != null) {
				
				for(int i=0;i<upfiles.length;i++) {
					String fileName = upfiles[i].getOriginalFilename();
					System.out.println(fileName);
					list.add(fileName);
				}
				
				int result2 = findDuplicateIndex(list);
				System.out.println(result2);
				if(result2>-1) {
				
				for(int i=0;i<result2;i++) {
					String fileName = upfiles[i].getOriginalFilename();
					String changeName = savePath(upfiles[i], session);
					li.setFileName(fileName);
					li.setFileRoot("resources/uploadFiles/" + changeName);
					li.setLostNo(lno);
					result += lostfindService.insertLostImg(li);
				}
				for(int i=(result2+1);i<upfiles.length;i++) {
					String fileName = upfiles[i].getOriginalFilename();
					String changeName = savePath(upfiles[i], session);
					li.setFileName(fileName);
					li.setFileRoot("resources/uploadFiles/" + changeName);
					li.setLostNo(lno);
					result += lostfindService.insertLostImg(li);
				}} else { result = (result-1);
					for(int i=0;i<upfiles.length;i++) {
						String fileName = upfiles[i].getOriginalFilename();
						String changeName = savePath(upfiles[i], session);
						li.setFileName(fileName);
						li.setFileRoot("resources/uploadFiles/" + changeName);
						li.setLostNo(lno);
						result += lostfindService.insertLostImg(li);
				}}
				
				if(result!=(upfiles.length)) {
					
					lostfindService.deleteLostfind(lno);
					lostfindService.deleteLostImg(lno);
					
					mv.addObject("errorMsg", "게시글 등록 실패")
					  .setViewName("common/errorPage");
				}
				
			}
		} else { // 실패
			
			mv.addObject("errorMsg", "게시글 등록 실패")
			  .setViewName("common/errorPage");
			
		}
		
		return mv;
		
	}
	
	@GetMapping("detail.lo")
	public ModelAndView selectNotice(int lno, int cpage,
									ModelAndView mv) {
		
		int result = lostfindService.increaseCount(lno);
		
		if(result > 0) {
			
			Lostfind l = lostfindService.selectLostfind(lno);
			ArrayList<LostImg> arrLi = lostfindService.selectLostImg(lno);
			mv.addObject("l", l)
			  .addObject("arrLi", arrLi)
			  .addObject("currentPage", cpage)
			  .setViewName("lostfind/lostfindDetailView");
			
		} else { 
			
			mv.addObject("errorMsg", "게시글 상세조회 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@PostMapping("delete.lo")
	public String deleteLostfind(int lno,
							  String filePath,
							  Model model,
							  HttpSession session) {
		
		int result = lostfindService.deleteLostfind(lno);
		
		if(result > 0) { // 성공
			
			if(!filePath.equals("")) {
				
				String realPath = session.getServletContext()
										 .getRealPath(filePath);
				
				new File(realPath).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			return "redirect:/list.lo";
			
		} else { 
			
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			
			return "common/errorPage";
		}
	}
	
	@PostMapping("updateForm.lo")
	public String updateForm(int lno, Model model, int cpage) {
	
		Lostfind l = lostfindService.selectLostfind(lno);
		ArrayList<LostImg> arrLi = lostfindService.selectLostImg(lno);
		model.addAttribute("l", l)
		  .addAttribute("arrLi", arrLi)
		  .addAttribute("currentPage", cpage);
		
		return "lostfind/lostfindUpdateForm";
	}
	
	@PostMapping("update.lo")
	public String updateLostfind(Lostfind l,
							  LostImg lI,
							  MultipartFile[] reupfiles,
							  String existingFilesData,
							  HttpSession session,
							  Model model) throws JsonMappingException, JsonProcessingException {
		
        if (existingFilesData == null) {
            throw new IllegalArgumentException("argument 'content' is null");
        }
        // content를 사용하는 코드

		String modifiedString = removeFirstCharacter(existingFilesData);
		int result=0;
		String alertMsg = "";
        ObjectMapper mapper = new ObjectMapper();
        
        System.out.println(existingFilesData);
        List<LostImg> existingFiles = mapper.readValue(modifiedString, new TypeReference<List<LostImg>>(){});
        
		if(existingFiles.size()==0) {
			lostfindService.deleteLostImg(l.getLostNo());
		} else {
			
				lostfindService.deleteExImg(existingFiles);

			
		}
		
		int result1 = lostfindService.updateLostfind(l);
		System.out.println(result1);
		System.out.println(reupfiles.length);
		System.out.println(l);
		ArrayList<String> list = new ArrayList<>();
		if(result1 > 0) { 

			
			if(reupfiles != null) {
				
				for(int i=0;i<reupfiles.length;i++) {
					String fileName = reupfiles[i].getOriginalFilename();
					list.add(fileName);
				}
				
				
				int result2 = findDuplicateIndex(list);
				if( result2 > -1) {
				for(int i=0;i<result2;i++) {
					String fileName = reupfiles[i].getOriginalFilename();
					String changeName = savePath(reupfiles[i], session);
					lI.setFileName(fileName);
					lI.setFileRoot("resources/uploadFiles/" + changeName);
					lI.setLostNo(l.getLostNo());
					result += lostfindService.insertLostImg(lI);
				}
				for(int i=(result2+1);i<reupfiles.length;i++) {
					String fileName = reupfiles[i].getOriginalFilename();
					String changeName = savePath(reupfiles[i], session);
					lI.setFileName(fileName);
					lI.setFileRoot("resources/uploadFiles/" + changeName);
					lI.setLostNo(l.getLostNo());
					result += lostfindService.insertLostImg(lI);
				}}
				
				if(result!=(reupfiles.length-1)) {
					
					alertMsg="첨부파일 수정 및 업로드에 실패하였습니다.";
				} 
		}

			
			session.setAttribute("alertMsg", alertMsg);
				
			return "redirect:/list.lo";
				
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
	
    public String removeFirstCharacter(String str) {
        if (str == null || str.length() == 0) {
            return str; // 문자열이 null이거나 비어 있는 경우 원본 문자열 반환
        }
        return str.replaceFirst("^.", ""); // 첫 문자를 빈 문자열로 대체
    }
	
    public int findDuplicateIndex(List<String> list) {
        Set<String> set = new HashSet<>();
        
        for (int i = 0; i<list.size();i++) {
            
            if (set.contains(list.get(i))) {
                return findFirstDuplicateIndex(list, i); // 첫 번째 중복값의 인덱스 반환
            } else {
            	set.add(list.get(i));
            }
            
        }
        
        return -1; // 중복값이 없을 경우 -1 반환
    }
    
    public int findFirstDuplicateIndex(List<String> list, int second) {
    	for (int i = 0; i<list.size();i++) {
    		if (list.get(i).equals(list.get(second))) {
    			return i;
    		} 
    	}
    	
    	return -1;
    }
}










