package com.kh.yoonsart.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yoonsart.member.model.service.MemberService;
import com.kh.yoonsart.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

// 0603 컨트롤러 작성 로그인 메소드(아이디 저장 기능 포함) -무진
@Controller
@Slf4j
public class MemberController {

	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	@PostMapping("login.me")
	public ModelAndView loginMember(Member m, String saveId, ModelAndView mv,
			                        HttpSession session, HttpServletResponse response) {
		
		// 아이디 저장 로직 추가
		if(saveId != null && saveId.equals("y")) {
			// 로그인 요청 시 아이디를 저장하겠다.
			
			// saveId 라는 키값으로 현재 아이디값을 쿠키로 저장
			Cookie cookie = new Cookie("saveId", m.getUserId());
			
			// 유효기간 1일
			cookie.setMaxAge(1 * 24 * 60 * 60); // 초단위로
			
			// 만들어진 Cookie 객체를 response 에 첨부
			response.addCookie(cookie);
			
		} else {
			// 아이디를 저장하지 않겠다.
			
			// 아이디를 저장한 쿠키 삭제
			// > 삭제 구문이 따로 없으므로
			//   동일한 키값으로 덮어씌우되, 유효기간을 0 초로 지정하면 됨
			Cookie cookie = new Cookie("saveId", m.getUserId());
			
			cookie.setMaxAge(0);
			
			response.addCookie(cookie);
		}
		
		// 암호화 기능을 적용한 로그인
		Member loginUser = memberService.loginMember(m);
		if(loginUser != null && 
				bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
				
				// 로그인 성공
				// 이 시점 기준으로 비번도 검증 완료
				
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("alertMsg", "성공적으로 로그인 되었습니다.");
				// url 재요청
				mv.setViewName("redirect:/");
				
			}else {
				
				// 로그인 실패
				mv.addObject("errorMsg","로그인 실패");
				mv.setViewName("common/errorPage");
			}
			
			return mv;
	}
}
