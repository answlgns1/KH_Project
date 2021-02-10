package com.kh.test.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TestDao {
	
	public List<Test> selectList() {
		Connection con = null;
		List<Test> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.10.3:1521:xe",
						"kh", "kh");
			
			con.setAutoCommit(false);
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		String sql = "SELECT * FROM TEST";
		
		try {
			
			rset = stmt.executeQuery(sql);
			
			while( rset.next() ) {
				Test test = new Test();
				
				test.setSeq(rset.getInt("SEQ"));
				test.setWriter(rset.getString("WRITER"));
				test.setTitle(rset.getString("TITLE"));
				test.setContent(rset.getString("CONTENT"));
				test.setRegdate(rset.getDate("REGDATE"));
				
				list.add(test);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		
		
		return list;
	}

}
