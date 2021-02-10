package com.kh.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;

@WebServlet("/update.me")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String userPwd=request.getParameter("userPwd");
		 String userPhone=request.getParameter("userPhone");
		 String userEmail=request.getParameter("userEmail");
		 String userAddress=request.getParameter("address");
		 String userBirth=request.getParameter("userBirth");
		
		// 해당 회원을 구분짓는 ID 받아오기
		HttpSession session = request.getSession(false);
		
		Member m = (Member)session.getAttribute("member");
		
		// 기존의 회원 정보를 새로운 값으로 변경하기
		m.setUserPwd(userPwd);
		m.setUserPhone(userPhone);
		m.setUserEmail(userEmail);
		m.setUserAddress(userAddress);
		m.setUserBirth(userBirth);
		
		System.out.println("변경한 회원 정보 확인 : " + m);
		
		MemberService ms = new MemberService();
		
		try {
			ms.updateMember(m);
	
			System.out.println("회원 정보 수정 완료!");
			
			session.invalidate();
			
			response.sendRedirect("index.jsp");
						
		} catch(MemberException e) {
			
			request.setAttribute("error-msg", "회원 정보 수정 중 에러 발생!");
			request.setAttribute("exception", e);
			
			request
			.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
