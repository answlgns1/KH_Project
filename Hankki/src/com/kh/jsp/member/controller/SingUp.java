package com.kh.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;

/**
 * Servlet implementation class SingUp
 */
@WebServlet("/SingUp.hankki")
public class SingUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SingUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		 String userId=request.getParameter("userId");
		 String userPwd=request.getParameter("userPwd");
		 String userName=request.getParameter("userName");
		 String userPhone=request.getParameter("userPhone");
		 String userEmail=request.getParameter("userEmail");
		 String address=request.getParameter("address1")
				 		+request.getParameter("address2")
				 		+request.getParameter("address3");
		 String userBirth=request.getParameter("userBirth");
		
		
		Member m = new Member(userId, userPwd, userName, userPhone, userEmail, address, userBirth);
		
		System.out.println(m);
		
		MemberService ms = new MemberService();
		int result = ms.memberInsert(m);
		if(result>0) {
			
			response.sendRedirect("index.jsp");
			
		}else {
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('회원가입에 실패하셨습니다');"  // request.getContextPath() 가 홈페이지 명까지 들고 옵니다.
																// localhost:8088/test/  --> 얘가 홈페이지 루트명이자 webapp의 이름입니다.
					+ " location.href='" + request.getContextPath() + "/views/member/signUp.jsp'; </script>");

			out.close();
		}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
