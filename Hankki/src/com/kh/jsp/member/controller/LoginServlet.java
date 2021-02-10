package com.kh.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;

@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      response.setContentType("text/html; charset=utf-8");
      
      String userId = request.getParameter("id");
      String userPwd = request.getParameter("pw");
      
      Member m = new Member(userId, userPwd);
      
      MemberService ms = new MemberService();
      
      m = ms.selectMember(m);
      
      if(m != null) {
         HttpSession session = request.getSession();
         PrintWriter out = response.getWriter();

         session.setAttribute("member", m);
         out.println("<script>history.go(-2) "
               + "</script>");
         
//         response.sendRedirect("index.jsp");
         
      } else {
         PrintWriter out = response.getWriter();
            
            out.println("<script>alert('로그인에 실패하셨습니다');"  // request.getContextPath() 가 홈페이지 명까지 들고 옵니다.
                                                   // localhost:8088/test/  --> 얘가 홈페이지 루트명이자 webapp의 이름입니다.
                  + " location.href='" + request.getContextPath() + "/views/member/loginForm.jsp'; </script>");

            out.close();
      }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }
}