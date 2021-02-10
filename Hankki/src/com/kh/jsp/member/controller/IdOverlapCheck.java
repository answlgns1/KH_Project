package com.kh.jsp.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jsp.member.model.service.MemberService;

/**
 * Servlet implementation class OverlapCheck
 */
@WebServlet("/idOverlapCheck.me")
public class IdOverlapCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdOverlapCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		String userid = request.getParameter("userid");
		
		System.out.println("userid"); // 값을 제대로 받아오는지 확인
		
		MemberService ms = new MemberService();
		
		int result = ms.idOverlapCheck(userid);
		
		if(result==1) {
			
			System.out.println("이메일이 중복되었습니다");
			
		}else {
			
			System.out.println("이 이메일은 사용이 가능합니다");
			
		}
		
		new Gson().toJson(result, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
}
