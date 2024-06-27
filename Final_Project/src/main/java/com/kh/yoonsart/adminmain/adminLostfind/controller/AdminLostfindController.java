package com.kh.yoonsart.adminmain.adminLostfind.controller;

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
import com.kh.yoonsart.notice.model.vo.Notice;

@Controller
public class AdminLostfindController {

	@Autowired
	private LostfindService lostfindService;
	
	@GetMapping("list.adlo")
	public String adNoticeList(Model model) {
		
		ArrayList<Lostfind> list = lostfindService.adSelectList();
		
		model.addAttribute("list", list);
		
		//System.out.println(list);
		
		return "admin/adminLostfindList";
	}
	
	
	@GetMapping("enrollForm.adlo")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		// 게시글 작성하기 페이지 포워딩
		// /WEB-INF/views/.jsp
		mv.setViewName("admin/adminLostfindEnrollForm");
		
		return mv;
	}
	

	@PostMapping("insert.adlo")
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
	
	
	@PostMapping("delete.adlo")
	public String deleteLostfind(Lostfind l,
							  String filePath,
							  Model model,
							  HttpSession session) {
		
		int result = lostfindService.deleteLostfind(l.getLostNo());
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			return "redirect:/updateForm.adlo?lno=" + l.getLostNo();
			
		} else { 
			
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			
			return "common/errorPage";
		}
	}
	
	@PostMapping("restore.adlo")
	public ModelAndView restoreLostfind(Lostfind l,
			String filePath,
			HttpSession session,
			ModelAndView mv) {
		int result = lostfindService.restoreLostfind(l.getLostNo());
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "게시글이 활성화 되었습니다.");
			mv.setViewName("redirect:/updateForm.adlo?lno=" + l.getLostNo());		
			
		} else { 
			
			mv.addObject("errorMsg", "게시글 활성화 실패").setViewName("common/errorPage");			
		}
		
		return mv;
	}
	
	@GetMapping("updateForm.adlo")
	public String updateForm(int lno, @RequestParam(value = "cpage", defaultValue = "1") int cpage, Model model) {
	
		Lostfind l = lostfindService.selectLostfind(lno);
		System.out.println(l);
		ArrayList<LostImg> arrLi = lostfindService.selectLostImg(lno);
		model.addAttribute("l", l)
		  .addAttribute("arrLi", arrLi)
		  .addAttribute("currentPage", cpage);
		
		return "admin/adminLostfindUpdateForm";
	}
	
	@PostMapping("update.adlo")
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
        System.out.println(existingFilesData);
        
		String modifiedString = removeFirstCharacter(existingFilesData);
		System.out.println(modifiedString);
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
				
			return "redirect:/list.adlo";
				
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










