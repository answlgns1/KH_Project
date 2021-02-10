package com.kh.jsp.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.attachment.model.vo.Attachment;
import com.kh.jsp.product.model.dao.ProductDao;
import com.kh.jsp.product.model.vo.Product;
import static com.kh.jsp.common.JDBCTemplate.*;

public class ProductService {

	private Connection con;
	private ProductDao pDAO = new ProductDao();

	public ArrayList<Product> selectList(String type) {

		con = getConnection();

		ArrayList<Product> list = pDAO.selectList(con, type);

		close(con);

		return list;
	}

	public Product selectProduct(int pno) {
		
		Product p=null;
		
		con=getConnection();
		
		
		ProductDao pd = new ProductDao();
		
		p=pd.selectProduct(con, pno);
		
		
		close(con);
		
		return p;
	
	}

	public int insertProduct(Product pd, ArrayList<Attachment> list) {
		con = getConnection();
		int result = 0;
		// 1. 사진 게시글 저장
		int result1 = pDAO.insertProduct(con, pd);
		
		// 2. 첨부파일 여러개 저장
		int result2 = 0;
		for(int i = 0; i < list.size(); i++) {
			// 첫번째 이미지는 대표 이미지 (flevel = 0)
			// 나머지는 서브이미지 (flevel = 1)
			list.get(i).setF_level(i == 0 ? 0 : 1);
			
			result2 = pDAO.insertAttachment(con, list.get(i), pd);
			
			if( result2 == 0 ) break;	// 잘못 실행된 행이 있다면 반복(insert) 취소!
		}
		
		if( result1 > 0 && result2 > 0 ) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	public int getListCount(String keyword) {
		con = getConnection();
		
		int result = pDAO.getListCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public ArrayList<Product> searchProduct(int currentPage, int limit, String keyword) {
		con = getConnection();
		
		ArrayList<Product> list = pDAO.searchProduct(con, currentPage, limit, keyword);
		
		close(con);
		
		return list;
	}

}












