package com.kh.jsp.qa.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.common.exception.QaException;
import com.kh.jsp.notice.model.service.NoticeService;
import com.kh.jsp.notice.model.vo.Notice;
import com.kh.jsp.qa.model.service.QaService;
import com.kh.jsp.qa.model.vo.Qa;

/**
 * Servlet implementation class QaUpdateView
 */
@WebServlet("/UpdateView.qa")
public class QaUpdateView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaUpdateView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 int qa_no = Integer.parseInt(request.getParameter("qa_no"));
			
			QaService qs = new QaService();
			
			String page = null;
			
			
			try {
				Qa q = qs.updateView(qa_no);
				
				request.setAttribute("qa", q);
				
				page = "views/QA/QA_Update.jsp";
				
				
			} catch (QaException e) {
				
				request.setAttribute("error-msg", "공지사항 수정 페이지 이동 실패!");
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
