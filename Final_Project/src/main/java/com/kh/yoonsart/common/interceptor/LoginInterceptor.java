package com.kh.yoonsart.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//login체크용 인터셉터 구현 - 0610 무진
public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
	
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null) {
			// 로그인이 된 상태
			// myPage.me 등 으로 요청이 제대로 도달해야함
			
			return true;
		}else {
			// 로그인이 안된 상태
			// myPage.me 등 으로 요청이 제대로 도달하면 안됨
			// session 에 일회성 알람문구 담기
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			
			// 메인페이지로 url 재요청
			response.sendRedirect(request.getContextPath());
			
			return false;
			
		}
	}
}
