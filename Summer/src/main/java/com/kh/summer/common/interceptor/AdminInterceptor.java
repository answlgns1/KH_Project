package com.kh.summer.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.summer.user.member.model.vo.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("member");
		
		if( m == null ) {
			System.out.println("비 로그인 상태에서 [" + request.getRequestURI() + "] 접근!");
			request.setAttribute("loc", "/"); // admin/selectAdminMain.do 
			request.setAttribute("msg", "로그인 후 이용해주세요");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response); // 화면 제어권을 넘기고
			
			return false; // 강제로 종료 시킴
		} else if( !m.getMembership().equals("A") ) {
			System.out.println(" 일반회원 상태에서 [" + request.getRequestURI() + "] 접근!");
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "잘못된 접근!");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

	
}
