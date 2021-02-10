package com.kh.jsp.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.common.exception.QuestionException;
import com.kh.jsp.notice.model.service.NoticeService;
import com.kh.jsp.question.model.service.QuestionService;

/**
 * Servlet implementation class QuestionDelete
 */
@WebServlet("/qDelete.qu")
public class QuestionDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		
		QuestionService qs = new QuestionService();
		
		try {
			int result = qs.deleteQuestion(q_no);
			
			response.sendRedirect("qSelectList.qu");
			
		} catch (QuestionException e) {
			
			request.setAttribute("exception", e);
			
			request.setAttribute("error-msg", "공지사항 삭제 오류 발생!");
			
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			
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
