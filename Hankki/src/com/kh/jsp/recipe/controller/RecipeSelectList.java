package com.kh.jsp.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.recipe.model.service.RecipeService;
import com.kh.jsp.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeSelectList
 */
@WebServlet("/rSelectList.re")
public class RecipeSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Recipe> list = new ArrayList<>();
		
		list = new RecipeService().selectList();
				
		String page = "";
		
		if(list != null) {
			request.setAttribute("list", list);
			page = "views/recipe/recipeList.jsp";
		} else {
			request.setAttribute("error-msg", "레시피 게시글 목록 조회 실패");
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
