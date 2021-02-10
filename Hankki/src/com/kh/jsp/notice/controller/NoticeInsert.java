package com.kh.jsp.notice.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.notice.model.service.NoticeService;
import com.kh.jsp.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsert
 */
@WebServlet("/nInsert.no")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
				String n_title = request.getParameter("title");
				//String a_id = request.getParameter("userId");
				String n_content = request.getParameter("content");
				
				SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
				
				Date ndate = null;
				try {
					ndate = new Date(sdf.parse(request.getParameter("date")).getTime());

				} catch (ParseException e) {
					
					e.printStackTrace();
				}
				
				Notice n = new Notice();
				
				n.setN_title(n_title);
				n.setN_content(n_content);
				//n.setN_writer(a_id);
				n.setN_date(ndate);
				
				NoticeService ns = new NoticeService();
				
				try {
					ns.insertNotice(n);
					response.sendRedirect("/nInsert.no");
					
				} catch (NoticeException e) {		
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
