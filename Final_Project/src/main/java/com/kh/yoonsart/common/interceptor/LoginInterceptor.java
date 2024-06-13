package com.kh.yoonsart.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//login체크용 인터셉터 구현 - 0610 무진
public class LoginInterceptor extends HandlerInterceptorAdapter{

	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        HttpSession session = request.getSession();
	        if (session.getAttribute("loginUser") != null) {
	            // 로그인이 된 상태
	            return true;
	        } else {
	            // 로그인이 안된 상태
	            if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
	                // AJAX 요청인 경우
	                response.setContentType("application/json;charset=UTF-8");
	                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	                response.getWriter().write("{\"message\":\"로그인 후 이용 가능한 서비스입니다.\"}");
	            } else {
	                // 일반 요청인 경우
	                session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
	                response.sendRedirect(request.getContextPath() + "/");
	            }
	            return false;
	        }
	    }
}
