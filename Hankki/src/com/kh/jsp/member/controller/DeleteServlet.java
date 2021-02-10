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


@WebServlet("/delete.me")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String userId = ((Member)session.getAttribute("member")).getUserId();

		MemberService ms = new MemberService();
		
		try {
			ms.deleteMember(userId);
			
			session.invalidate();
			
			response.sendRedirect("index.jsp");
			
		} catch(MemberException e) {
			request.setAttribute("error-msg", "회원 탈퇴 실패");
			request.setAttribute("exception", e);
			
			request
			.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
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
