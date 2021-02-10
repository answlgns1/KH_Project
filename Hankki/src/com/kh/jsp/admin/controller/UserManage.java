package com.kh.jsp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.admin.model.service.AdminService;
import com.kh.jsp.member.model.vo.Member;
import com.kh.jsp.common.*;

/**
 * Servlet implementation class UserManage
 */
@WebServlet("/user_Manage.ad")
public class UserManage extends HttpServlet {
	private static final long serialVersionUID = 100101L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManage() {
        super();
        // TODO Auto-generated constructor stub 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 게시판 목록 처리용 변수
		ArrayList<Member> list = new ArrayList<>();
		AdminService as = new AdminService();
		
		// 페이징 처리에 필요한 변수들
		// 1, 2, 3, 4
		int startPage;
		
		// 마지막 페이지
		// 1 ... 10 / 11 ... 20
		int endPage;
		
		// 전체 게시글 갯수 기준 마지막 페이지
		int maxPage;
		
		// 현재 사용자가 보는 페이지
		int currentPage;
		
		// 한 페이지 당 보여줄 게시글 수
		int limit = 10;
		
		// 만약 사용자가 처음 목록을 조회했다면
		// 페이지는 1페이지가 되어야 함
		currentPage = 1;
		
		// 만약 사용자가 특정 페이지 번호를 가지고 있다면
		if(request.getParameter("currentPage") != null) {
			currentPage
			  = Integer.parseInt(request.getParameter("currentPage")); 
		}
		
		// 총 게시글 수 가져오기
		int listCount = as.getListCount();
		
//		System.out.println("총 게시글 수 : " + listCount);
		
		// 총 게시글 수 300개!
		// 페이지 수는 30개!!
		// 만약 게시글 수 301개 !
		// 페이지 수는 31개 !
		// 게시글                                  페이지
		// 13 ---> 1.3(올림) --> 2
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		// 한 번에 보일 시작 페이지와 끝 페이지
		// 1 ~ 10
		// 시작 : 1 / 끝 : 10
		// 11 ~ 20
		// 시작 : 11 / 끝 : 20
		startPage = (int)(((double)currentPage/limit + 0.9) - 1) * limit + 1;
		
		endPage = startPage + limit - 1;
		
		// 만약 마지막 페이지가 끝페이지 보다 작다면
		if( endPage > maxPage ) {
			endPage = maxPage;
		}
		
		// --------------------- 페이지 처리 끝 ! ~_~ ------------------- //
		
		list = as.selectList(currentPage, limit);
		
		String page = "";
		
		if( list != null && list.size() > 0) {
			PageInfo pi = new PageInfo(currentPage, listCount, limit,
										maxPage, startPage, endPage);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			page = "views/admin/User/UserManage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
