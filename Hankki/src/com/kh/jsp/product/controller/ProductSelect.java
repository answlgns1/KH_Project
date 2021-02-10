package com.kh.jsp.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.product.model.service.ProductService;
import com.kh.jsp.product.model.vo.Product;

/**
 * Servlet implementation class ProductSelect
 */
@WebServlet("/productinfo.me")
public class ProductSelect extends HttpServlet {
	private static final long serialVersionUID = 1231L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	response.setContentType("text/html; charset=utf-8");
		
	int pno = Integer.parseInt(request.getParameter("no"));
	
	ProductService ps = new ProductService();
	
	Product p = ps.selectProduct(pno);
	
	System.out.println(p);
	
	HttpSession session = request.getSession();
	
	session.setAttribute("product", p);
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
