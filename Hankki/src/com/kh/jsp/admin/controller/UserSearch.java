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

@WebServlet("/searchUser.um")
public class UserSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserSearch() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 검색 옵션(condition)
		String condition = request.getParameter("con");
		
		// 검색 키워드(keyword)
		String keyword = request.getParameter("keyword");
		
		ArrayList<Member> list = new ArrayList<>();
		
		AdminService as = new AdminService();
		
		String page = null;
		
		list = as.searchMember(condition, keyword);
		
		request.setAttribute("list", list);
		
		page = "views/admin/User/UserManage.jsp";
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
