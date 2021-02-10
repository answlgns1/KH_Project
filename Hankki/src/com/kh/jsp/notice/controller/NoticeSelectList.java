package com.kh.jsp.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.notice.model.service.NoticeService;
import com.kh.jsp.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeSelectList
 */
@WebServlet("/SelectList.no")
public class NoticeSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSelectList() {
        super();
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Notice> list = new ArrayList<>();
		
		NoticeService ns = new NoticeService();
		
		String page = null;
		
		try {
			list = ns.selectList();
			
			request.setAttribute("list", list);
			
			page = "views/notice/noticeList.jsp";
			
		} catch (NoticeException e) {
			
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
