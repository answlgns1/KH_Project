package com.kh.jsp.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.QaException;
import com.kh.jsp.common.exception.QuestionException;
import com.kh.jsp.qa.model.service.QaService;
import com.kh.jsp.qa.model.vo.Qa;
import com.kh.jsp.question.model.service.QuestionService;
import com.kh.jsp.question.model.vo.Question;

/**
 * Servlet implementation class QuestionSelectOne
 */
@WebServlet("/qSelectOne.qu")
public class QuestionSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		
		QuestionService qs = new QuestionService();
		
		String page = "";
		
		try {
			Question qu = qs.selectOne(q_no);
			request.setAttribute("q", qu);
			
			page = "/views/question/questionDetail.jsp";
			
		} catch (QuestionException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "공지사항 상세 조회 실패!");
			
			page = "views/common/errorPage.jsp";
			
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(page).forward(request, response);
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
