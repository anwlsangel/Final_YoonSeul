package com.kh.yoonsart.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 0604 로그아웃 기능용 메소드 - 무진
	// 로그아웃용 메소드
		@GetMapping("logout.me")
		public ModelAndView logoutMember(HttpSession session,
										 ModelAndView mv) {
			
			session.removeAttribute("loginUser");
			
			// 일회성 알람문구 담아서 메인페이지로 url 재요청
			session.setAttribute("alertMsg", "성공적으로 로그아웃 되었습니다.");
			
			mv.setViewName("redirect:/");
			
			return mv;
		}
	
	// 회원 가입용 메소드 0604 - 무진
	@GetMapping("enrollForm.me")
	public String enrollForm() {
		
		// 여기서는 단순히 회원가입페이지만 포워딩
		// /WEB-INF/views/member/memberEnrollForm.jsp
		
		return "member/memberEnrollForm";
		
	}	
	
	// Member Controller 회원가입 처리용 메소드 0604 - 무진
		@PostMapping("insert.me")
		public String insertMember(Member m, Model model, HttpSession session) {
			
			// 요청시 전달값 뽑기
			
//			System.out.println("평문 : " + m.getUserPwd());
			
			// 암호화 과정 
			String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
//			System.out.println("암호문 : " + encPwd);
			
			// 커맨드 객체 방식으로 전달받은 m 의 userPwd 필드값을 encPwd 값으로 셋팅
			m.setUserPwd(encPwd);
			
			int result = memberService.insertMember(m);
			
			// 결과에 따른 응답페이지 지정
			if(result > 0) { // 성공
				// 일회성 알람문구 담아서 메인페이지로 url 재요청
				session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
				
				// url 재요청
				return "redirect:/";
			} else { // 실패
				
				// 에러문구를 담아서 에러페이지로 포워딩
				model.addAttribute("errorMsg","회원가입 실패");
				
				// 포워딩
				// /WEB-INF/views/common/errorPage.jsp
				return "common/errorPage";
				
			}
			
		}
		
		// MemberController 아이디 체크용 메소드 0604 -무진
		@ResponseBody
		@GetMapping(value = "idCheck.me", produces = "text/html; charset=UTF-8")
		public String idCheck(String checkId) {
			
			//> 중복확인 할 아이디 값이 전달 됨
			
			/*
			 * int count = memberService.idCheck(checkId);
			 * 
			 * // count 가 1일 경우 : 이미 존재하는 아이디 (사용 불가) // count 가 0일 경우 : 존재 하지 않는 아이디 (사용
			 * 가능) if(count > 0) { // 사용불가능 "NNNNN"
			 * 
			 * return "NNNNN";
			 * 
			 * }else { // 사용 가능 "NNNNY" return "NNNNY"; }
			 */
			int count = memberService.idCheck(checkId);
			
			return (count > 0) ? "NNNNN": "NNNNY";
				
		}
		
		// MemberController 마이페이지조회용 메소드 0604 - 무진
		@GetMapping("myPage.me")
		public String myPage() {
			
			//System.out.println("마이페이지 요청됨");
			log.debug("마이페이지 요청됨");
			// 마이페이지 화면 포워딩
			// /WEB-INF/views/member/myPage.jps
			return "member/myPage";
			
		}
		
}






















