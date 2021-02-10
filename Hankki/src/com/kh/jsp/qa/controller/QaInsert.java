package com.kh.jsp.qa.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.QaException;
import com.kh.jsp.qa.model.service.QaService;
import com.kh.jsp.qa.model.vo.Qa;

/**
 * Servlet implementation class QaInsert
 */
@WebServlet("/Insert.qa")
public class QaInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String qa_title = request.getParameter("title");
		String m_id = request.getParameter("userId");
		String qa_content = request.getParameter("content");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date ndate = null;
		try {
			ndate = new Date(sdf.parse(request.getParameter("date")).getTime());

		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		Qa q = new Qa();
		
		q.setQa_title(qa_title);
		q.setQa_content(qa_content);
		q.setQa_writer(m_id);
		q.setQa_date(ndate);
		
		QaService qs = new QaService();
		
		try {
			qs.insertQa(q);
			response.sendRedirect("/Insert.qa");
			
		} catch (QaException e) {		
			e.printStackTrace();
			request.setAttribute("exception", e);
			
			request.setAttribute("error-msg", "공지사항 등록 실패!");
			
			request.getRequestDispatcher("views/common/errorPage.jsp")
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
