package com.kh.jsp.recipe.model.dao;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jsp.recipe.model.vo.Recipe;
import com.kh.jsp.recipe.model.vo.Attachment;

public class RecipeDAO {
	
	private Properties prop = null;
	
	public RecipeDAO() {
		prop = new Properties();
		
		String filePath = RecipeDAO.class
				          .getResource("/config/recipe-sql.properties")
				          .getPath();
		
		try {
			prop.load( new FileReader(filePath));
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		} catch (IOException e) {		
			e.printStackTrace();
		}
		
	}

	public ArrayList<Recipe> selectList(Connection con) {
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
            while(rset.next()) {
				
				Recipe rb = new Recipe();
				
				rb.setRb_no(rset.getInt("rb_no"));
				rb.setRb_writer(rset.getString("rb_writer"));
				rb.setRb_title(rset.getString("rb_content"));
				rb.setRb_content(rset.getString("rb_content"));
				rb.setRb_date(rset.getDate("rb_date"));
				rb.setRb_recommend_count(rset.getInt("rb_recommend_count"));
				rb.setRb_value(rset.getInt("rb_value"));
				rb.setRb_count(rset.getInt("rb_count"));
				rb.setRb_attachment(rset.getString("rb_attachment"));				
				
				list.add(rb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list; 
	}

	public HashMap<String, Object> selectOne(Connection con, int rb_no) {
		
		HashMap<String, Object> hmap = new HashMap<>();
		
		ArrayList<Attachment> list = new ArrayList<>();
		
		Recipe r = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rb_no);
			
			while(rset.next()) {
				r = new Recipe();
				
				r.setRb_no(rb_no);
				r.setRb_writer(rset.getString("rb_writer"));
				r.setRb_title(rset.getString("rb_title"));
				r.setRb_content(rset.getString("rb_content"));
				r.setRb_date(rset.getDate("rb_date"));
				r.setRb_recommend_count(rset.getInt("rb_recommend_count"));
				r.setRb_value(rset.getInt("rb_value"));
				r.setRb_count(rset.getInt("rb_count"));
				r.setRb_attachment(rset.getString("rb_attachment"));
				
                Attachment at = new Attachment();
				
				at.setFno(rset.getInt("fno"));
				at.setRb_no(rb_no);
				at.setOriginname(rset.getString("originname"));
				at.setChangename(rset.getString("changename"));
				at.setUploaddate(rset.getDate("uploaddate"));
				at.setFlevel(rset.getInt("flevel"));
				
				list.add(at);
			}
			
			hmap.put("recipe", r);
			hmap.put("attachment", list);
						
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
