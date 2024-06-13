package com.kh.yoonsart.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.common.template.Pagination;
import com.kh.yoonsart.member.model.service.MemberService;
import com.kh.yoonsart.member.model.vo.Member;
import com.kh.yoonsart.payment.model.vo.BuyList;

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
	@ResponseBody
	public ResponseEntity<Map<String, String>> insertMember(@RequestBody Member m, HttpSession session) {
	    Map<String, String> response = new HashMap<>();

	    // 암호화 과정 
	    String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
	    m.setUserPwd(encPwd);

	    try {
	        int result = memberService.insertMember(m);

	        if (result > 0) { // 성공
	            session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
	            response.put("status", "success");
	            return ResponseEntity.ok(response);
	        } else { // 실패
	            response.put("status", "fail");
	            response.put("message", "회원가입 실패");
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	        }
	    } catch (DuplicateKeyException e) {
	        // 중복 키 에러 처리
	        response.put("status", "duplicate");
	        response.put("message", "중복된 회원이 존재합니다. 다시 시도해주세요.");
	        return ResponseEntity.status(HttpStatus.CONFLICT).body(response);
	    } catch (Exception e) {
	        // 기타 예외 처리
	        response.put("status", "error");
	        response.put("message", "회원가입 중 오류가 발생했습니다.");
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}

		// MemberController 아이디 체크용 메소드 0604 -무진
		// MemberController checkId() 변경 아이디 중복 검사 0605 - 무진
		@ResponseBody
		@PostMapping(value = "idCheck.me", produces = "text/html; charset=UTF-8")
	    public String checkId(@RequestParam("userId") String userId) {
			return memberService.idCheck(userId)>0?"1":"0";
	        
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
		
		// MemberController 회원정보 수정용 메소드 0604 - 무진
		@PostMapping("update.me")
		public String updateMember(Member m, Model model,
								HttpSession session) {
			
			
			int result = memberService.updateMember(m);
			if(result > 0) { // 성공
				// 갱신된 회원의 정보를 다시 조회해와서
				Member updateMem = memberService.loginMember(m);
				// 기존의 loginMember 서비스를 재활용(아이디만 가지고 조회)
				
				// session 의 loginUser 에 덮어씌워야함
				session.setAttribute("loginUser", updateMem);
				session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");
				
				// 마이페이지로 url 재요청
				return "redirect:/myPage.me";
			}else { // 실패
				
				// 에러문구를 담아서
				model.addAttribute("errorMsg", "회원정보 변경 실패");
				// 에러페이지로 포워딩
				//  /WEB-INF/views/common/errorPage.jsp
				return "common/errorPage";
			}
		}
		
		// MemberController 전화번호 중복 검사용 메소드 0610 - 무진
			@PostMapping("/checkPhone.me")
		    @ResponseBody
		    public String checkPhone(@RequestParam("phone") String phone) {
				return memberService.checkPhone(phone) > 0 ? "1" : "0";
		  }
		 
		// MemberController 이메일 중복 검사용 메소드 0610 - 무진
		@PostMapping("/checkEmail.me")
		 @ResponseBody
		 public String checkEmail(@RequestParam("email") String email) {
			return memberService.checkEmail(email) > 0 ? "1" : "0";
		    }
		
		// 회원 탈퇴용 메소드
		@PostMapping("delete.me")
		public String deleteMember(Member m, HttpSession session, Model model) {
			
			
			// 비밀번호 먼저 대조
			// 평문은 가지고 있으니 암호화된 비번 구하기 : session 의 loginUser 의 userPwd 필드에 있음
			String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
			
			if(bcryptPasswordEncoder.matches(m.getUserPwd(), encPwd)) {
				// 비밀번호가 맞을 경우
				// > 탈퇴 처리 아까만든 업데이트문 실행
				int result = memberService.deleteMember(m.getUserId());
				
				if(result > 0) { // 탈퇴 처리 성공
					
					// 알람문구 담아서 로그아웃 처리 
					session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해 주셔서 감사합니다.");
					session.removeAttribute("loginUser");
					// 메인페이지로 url 재요청
					return "redirect:/";
				} else { // 탈퇴 처리 실패
					
					// 에러문구를 담아서
					model.addAttribute("errorMsg", "회원 탈퇴 실패");
					
					// 에러페이지로 포워딩
					// /WEB-INF/views/common/errorPage.jsp
					
					return "common/errorPage";
					
				}
				
			}else {
				// 비밀번호가 틀릴 경우
				// 일회성 알암 문구로 비밀번호 틀렸다고 알려주고 
				session.setAttribute("alertMsg", "비밀번호를 잘못 입력하셨습니다. 다시 확인해 주세요");
				// 마이페이지로 url 재요청
				
				return "redirect:/myPage.me";
			}
			
		}
		
		//예매내역 페이지 포워딩
		@GetMapping(value="myTicketList.me", produces="application/json; charset=UTF-8")
		public String myTicketList(Model model, String userId) {
			//ArrayList<BuyList> list = paymentService.selectTicketList(userId);
			//System.out.println(list);

			//model.addAttribute("buylist", list);
			return "member/myTicketList";
		}
		
		//예매내역 조회 + 페이징처리
		@ResponseBody
		@GetMapping(value="ajaxTicketList.me", produces="application/json; charset=UTF-8")
		public JSONObject ajaxTicketList(int currentPage, String userId) {
			// --- 페이징 처리 ---
			int listCount = memberService.selectTicketCount(userId); //현재 총 게시글 개수
			//int currentPage; //현재 페이지 (즉, 사용자가 요청한 페이지)
			int pageLimit = 5; //페이지 하단에 보여질 페이징바의 페이지 최대 개수
			int boardLimit = 5; // 한 페이지에 보여질 게시글의 최대 개수 (몇개단위로 게시글이 보여질건지)
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
			ArrayList<BuyList> list = memberService.selectMyTicketList(userId, pi);
			
			JSONArray ticketList = new JSONArray();
			for (BuyList bl : list) {
				// replyList.add(er); <- 이렇게 VO 를 대놓고 넣으면 안됨
				JSONObject buyList = new JSONObject();
				buyList.put("buyListId", bl.getBuyListId());
				buyList.put("reserveCode", bl.getReserveCode());
				buyList.put("reserveConcertId", bl.getReserveConcertId());
				buyList.put("reserveTicket", bl.getReserveTicket());
				buyList.put("reserveSum", bl.getReserveSum());
				buyList.put("reservePayment", bl.getReservePayment());
				buyList.put("reserveRefund", bl.getReserveRefund());
				buyList.put("userId", bl.getUserId());

				ticketList.add(buyList);
			}
			
			JSONObject pageInfo = new JSONObject();
			pageInfo.put("listCount", listCount);
			pageInfo.put("currentPage", currentPage);
			pageInfo.put("pageLimit", pageLimit);
			pageInfo.put("boardLimit", boardLimit);
			pageInfo.put("maxPage", pi.getMaxPage());
			pageInfo.put("startPage", pi.getStartPage());
			pageInfo.put("endPage", pi.getEndPage());
			
			JSONObject result = new JSONObject();
			result.put("ticketList", ticketList);
			result.put("pageInfo", pageInfo);
			
			return result;
		}
		
}






















