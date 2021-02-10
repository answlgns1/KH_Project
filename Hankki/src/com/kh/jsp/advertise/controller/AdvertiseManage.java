package com.kh.jsp.advertise.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.advertise.model.service.AdvertiseService;
import com.kh.jsp.advertise.model.vo.Advertisement;

/**
 * Servlet implementation class AdvertiseManage
 */
@WebServlet("/advertise_Manage.ad")
public class AdvertiseManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdvertiseManage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Advertisement> list = new ArrayList<>();
		
		list = new AdvertiseService().selectList();
		
		String page = "";
		
		if(list != null) {
			request.setAttribute("list", list);
			page = "views/admin/Advertise/AD_Manage.jsp";
		} else {
			request.setAttribute("error-msg", "사진 게시글 목록 조회 실패!");
			page = "views/common/errorPage.jsp";
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
