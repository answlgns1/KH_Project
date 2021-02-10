package com.kh.jsp.recipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jsp.recipe.model.dao.RecipeDAO;
import com.kh.jsp.recipe.model.vo.Recipe;
import static com.kh.jsp.common.JDBCTemplate.*;

public class RecipeService {
	
	private Connection con;
	private RecipeDAO rDAO = new RecipeDAO();
	
	public ArrayList<Recipe> selectList() {
		con = getConnection();
		
		ArrayList<Recipe> list = rDAO.selectList(con);
		
		close(con);
		
		return list;
	} 
	
	public HashMap<String, Object> selectOne(int rb_no) {
		
		con = getConnection();
		
		HashMap<String, Object> hmap = rDAO.selectOne(con, rb_no);
		
		close(con);

		return hmap;
		
	}

	

	
	
}
