package com.kh.jsp.advertise.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.admin.model.service.AdminService;
import com.kh.jsp.advertise.model.service.AdvertiseService;
import com.kh.jsp.advertise.model.vo.Advertisement;
import com.kh.jsp.member.model.vo.Member;


@WebServlet("/searchAdvertise.ad")
public class AdvertiseSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdvertiseSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 검색 옵션(condition)
		String condition = request.getParameter("con");
		
		// 검색 키워드(keyword)
		String keyword = request.getParameter("keyword");
		
		ArrayList<Advertisement> list = new ArrayList<>();
		
		AdvertiseService ads = new AdvertiseService();
		
		String page = null;
		
		list = ads.searchMember(condition, keyword);
		
		request.setAttribute("list", list);
		
		page = "views/admin/Advertise/AD_Manage.jsp";
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}











