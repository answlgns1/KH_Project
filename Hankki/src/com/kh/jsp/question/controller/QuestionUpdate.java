package com.kh.jsp.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.QuestionException;
import com.kh.jsp.question.model.service.QuestionService;
import com.kh.jsp.question.model.vo.Question;

/**
 * Servlet implementation class QuestionUpdate
 */
@WebServlet("/qUpdate.qu")
public class QuestionUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String q_title = request.getParameter("title");
        String q_content = request.getParameter("content");
        String q_attachment = request.getParameter("attachment");
        
        Question qu = new Question();
        
        qu.setQ_title(q_title);
        qu.setQ_content(q_content);
        qu.setQ_attachment(q_attachment);
        
        QuestionService qs = new QuestionService();
        
        try {
			int result = qs.updateQuestion(qu);
			
			response.sendRedirect("qSelectList.qu");
			
		} catch (QuestionException e) {
			request.setAttribute("error-msg", "공지사항 수정 실패!");
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher("views/common/errorPage.jsp")
			            .forward(request, response);
			e.printStackTrace();
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
