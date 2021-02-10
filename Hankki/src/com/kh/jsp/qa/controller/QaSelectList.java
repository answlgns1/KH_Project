package com.kh.jsp.qa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.QaException;
import com.kh.jsp.qa.model.service.QaService;
import com.kh.jsp.qa.model.vo.Qa;

/**
 * Servlet implementation class QaSelectList
 */
@WebServlet("/SelectList.qa")
public class QaSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Qa> list2 = new ArrayList<>();
		
		QaService qs = new QaService();
		
		String page = null;
		
		try {
			list2 = qs.selectList();
			
            request.setAttribute("list2", list2);
			
			page = "views/QA/QA_List.jsp";
			
		} catch (QaException e) {
			
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
