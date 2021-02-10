package com.kh.jsp.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.PageInfo;
import com.kh.jsp.product.model.service.ProductService;
import com.kh.jsp.product.model.vo.Product;


@WebServlet("/productSearch.pd")
public class ProductSearch extends HttpServlet {
	private static final long serialVersionUID = 1009L;
       

    public ProductSearch() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String keyword = request.getParameter("con");
		ArrayList<Product> list = new ArrayList<>();
		ProductService ps = new ProductService();
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit = 6;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage
			  = Integer.parseInt(request.getParameter("currentPage")); 
		}
		
		// 총 게시글 수 가져오기
		int listCount = ps.getListCount(keyword);
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		startPage = (int)(((double)currentPage/limit + 0.9) - 1) * limit + 1;
		
		endPage = startPage + limit - 1;
		if( endPage > maxPage ) {
			endPage = maxPage;
		}
		
		list = ps.searchProduct(currentPage, limit, keyword);
		
		
		String page = "";
		
		if( list != null && list.size() > 0) {
			PageInfo pi = new PageInfo(currentPage, listCount, limit,
										maxPage, startPage, endPage);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.setAttribute("keyword", keyword);
			
			page = "views/product/product.jsp";
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
















