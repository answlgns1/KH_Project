package com.kh.jsp.recipe.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.recipe.model.service.RecipeService;

/**
 * Servlet implementation class RecipeSelectOne
 */
@WebServlet("/rSelectOne.re")
public class RecipeSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rb_no = Integer.parseInt(request.getParameter("rb_no"));
		
		HashMap<String, Object> recipe
		    = new RecipeService().selectOne(rb_no);
		
		String page = "";
		
		if( recipe != null && recipe.get("recipe") != null) {
			request.setAttribute("recipe", recipe.get("recipe"));
			request.setAttribute("fileList", recipe.get("attachment"));
			
			page  = "views/recipe/recipeDetail.jsp";
			
		} else {
			request.setAttribute("exception", new Exception("게시글 상세 조회 실패"));
            request.setAttribute("error-msg", "게시글 상세 조회 실패!");
			
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
