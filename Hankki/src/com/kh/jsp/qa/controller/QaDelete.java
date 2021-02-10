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
import com.kh.jsp.qa.model.service.QaService;

/**
 * Servlet implementation class QaDelete
 */
@WebServlet("/Delete.qa")
public class QaDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int qa_no = Integer.parseInt(request.getParameter("qa_no"));
			
			QaService qs = new QaService();
			
			try {
				int result = qs.deleteQa(qa_no);
				
				response.sendRedirect("SelectList.qa");
				
			} catch (QaException e) {
				
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
