package com.kh.jsp.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.QuestionException;
import com.kh.jsp.question.model.service.QuestionService;
import com.kh.jsp.question.model.vo.Question;

/**
 * Servlet implementation class QuestionSelectList
 */
@WebServlet("/qSelectList.qu")
public class QuestionSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
      ArrayList<Question> list3 = new ArrayList<>();
		
		QuestionService qs = new QuestionService();
		
		String page = null;
		
		try {
			list3 = qs.selectList();
			
            request.setAttribute("list3", list3);
			
			page = "views/question/questionList.jsp";
			
		} catch (QuestionException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "공지사항 조회 실패!");
			
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
