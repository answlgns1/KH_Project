package com.kh.jsp.product.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jsp.attachment.model.vo.Attachment;
import com.kh.jsp.product.model.vo.Product;

public class ProductDao {

	Properties prop=null;
	
	public ProductDao() {
		
		prop=new Properties();
		
		String path = ProductDao.class.getResource("/config/product-sql.properties").getPath();
		 
		try {
			prop.load(new FileReader(path));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Product selectProduct(Connection con, int pno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
//		int p_no = pno.getP_no();
		
		String str = prop.getProperty("selectProduct");
		
		try {
			pstmt=con.prepareStatement(str);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				p=new Product();
				
				p.setP_no(rset.getInt(1));
				p.setP_type(rset.getString(2));
				p.setP_name(rset.getString(3));
				p.setP_price(Integer.parseInt(rset.getString(4)));
				p.setP_amount(rset.getInt(5));
				p.setP_weight(rset.getString(6));
				p.setP_explain(rset.getString(7));
				p.setP_attachment(rset.getString(8));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);			
		}
		
			return p;
		
	}
	
	public ArrayList<Product> selectList(Connection con, String type) {

		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String p_title = "";
		String sql = null;

		switch (type) {

		case "new_product":
			sql = prop.getProperty("product_new"); // 최근 상품 6개
			p_title = "신";
			break;

		case "best_product":
			sql = prop.getProperty("product_best"); // 조회수가 높은 상품 6개
			p_title="BEST";
			break;

		case "discount_product":
			sql = prop.getProperty("product_discount"); // 할인품목
			p_title="할인";
			break;
		default:
			sql = prop.getProperty("product_category"); // 카테고리 항목
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);

			if (sql == prop.getProperty("product_category")) {
				pstmt.setString(1, type);
			}
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {

				if (p_title=="") {
					p_title=rset.getString("p_type_explain");
				}
				
				Product pd = new Product();

				pd.setP_no(rset.getInt("p_no"));
				pd.setP_type(rset.getString("p_type_explain"));
				pd.setP_name(rset.getString("p_name"));
				pd.setP_price(Integer.parseInt(rset.getString("p_price")));
				pd.setP_attachment(rset.getString("f_change_name"));
				pd.setP_explain(p_title);
				
				list.add(pd);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int insertProduct(Connection con, Product pd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pd.getP_type());
			pstmt.setString(2, pd.getP_name());
			pstmt.setInt(3, pd.getP_price());
			pstmt.setInt(4, pd.getP_amount());
			pstmt.setString(5, pd.getP_weight());
			pstmt.setString(6, pd.getP_explain());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection con, Attachment attachment, Product pd) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = con.prepareStatement(sql);
			

			pstmt.setInt(1, attachment.getF_level());
			pstmt.setString(2, attachment.getF_name());
			pstmt.setString(3, attachment.getF_change_name());
			pstmt.setString(4, attachment.getF_filepath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection con, String keyword) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if( rset.next() ) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Product> searchProduct(Connection con, int currentPage, int limit, String keyword) {
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		
		String sql = prop.getProperty("searchProduct");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()){
				
				Product p = new Product();
				
				p.setP_no(rset.getInt("P_NO"));
				p.setP_type(rset.getString("P_TYPE_EXPLAIN"));
				p.setP_name(rset.getString("P_NAME"));
				p.setP_price(rset.getInt("P_PRICE"));
				p.setP_attachment(rset.getString("F_CHANGE_NAME"));
				p.setP_explain(rset.getString("P_EXPLAIN"));
				
				list.add(p);
				System.out.println(list);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}









