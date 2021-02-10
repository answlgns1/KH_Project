package com.kh.jsp.question.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class QuestionSearch
 */
@WebServlet("/qSearch.qu")
public class QuestionSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String condition = request.getParameter("con");
			
			String keyword = request.getParameter("keyword");
			
			System.out.println(condition + " : " + keyword);
			
			ArrayList<Question> list3 = new ArrayList<>();
			
			QuestionService qs = new QuestionService();
			
			String page = null;
			
			try {
				list3 = qs.searchQuestion(condition, keyword);
				
				request.setAttribute("list3", list3);
				
				page = "views/question/question_List.jsp";
				
			} catch (QuestionException e) {
				request.setAttribute("exception", e);
				request.setAttribute("error-msg", "검색 실패!");
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
