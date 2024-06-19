package com.kh.yoonsart.adminmain.adminMember.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.yoonsart.adminmain.adminMember.model.service.AdminMemberService;
import com.kh.yoonsart.member.model.vo.Member;	

@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@GetMapping("AdMemberList.me")
	public String SelectAdConcert(Model model) {

		ArrayList<Member> list = adminMemberService.adSelectList();
		
		model.addAttribute("list", list);
		return "admin/AdminMemberList";
		
	}
	
	@GetMapping("AdupdateMemberForm.me")
	public String updateMemberForm(@RequestParam("userId") String userId, Model model) {
	    Member m = adminMemberService.adMemberDetail(userId);
	    model.addAttribute("m", m);
	    return "admin/AdminMemberDetail";
	}

	@PostMapping(value = "adminUpdateMember.me", produces = "text/html; charset=UTF-8")
    public String adminUpdateMember(@ModelAttribute Member m, RedirectAttributes redirectAttributes) {
        int result = adminMemberService.updateMember(m);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("alertMsg", "회원 정보 수정 성공!");
            return "redirect:AdupdateMemberForm.me?userId=" + m.getUserId();
        } else {
            redirectAttributes.addFlashAttribute("errorMsg", "회원 정보 수정에 실패했습니다.");
            return "redirect:AdupdateMemberForm.me?userId=" + m.getUserId();
        }
    }

	
}
