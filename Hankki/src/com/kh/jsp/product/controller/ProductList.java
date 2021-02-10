package com.kh.jsp.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.product.model.service.ProductService;
import com.kh.jsp.product.model.vo.Product;

/**
 * Servlet implementation class ProductList
 */
@WebServlet("/product.pd")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1008L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String type = request.getParameter("type");
	
		ArrayList<Product> list = new ArrayList<>();
		
		list = new ProductService().selectList(type);
		
		String page = "";
		
		if(list != null) {
			request.setAttribute("list", list);
			page="views/product/product.jsp";
		} else {
			request.setAttribute("error-msg", "상품 목록 조회 실패");
			page="views/common/errorPage.jsp";
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
