package com.kh.yoonsart.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.yoonsart.member.model.vo.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null) {
			String id = ((Member)session.getAttribute("loginUser")).getUserId();
			if (id.equals("admin")) {
				return true;
			}else {
				 session.setAttribute("alertMsg", "잘못된 접근입니다.");
	             response.sendRedirect(request.getContextPath() + "/");
			}
		}else {
			session.setAttribute("alertMsg", "잘못된 접근입니다.");
            response.sendRedirect(request.getContextPath() + "/");
		}
		return false;
	}
}
