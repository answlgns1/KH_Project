package com.kh.jsp.admin.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jsp.member.model.vo.Member;
import static com.kh.jsp.common.JDBCTemplate.*;

public class AdminDAO {
	
	private Properties prop;
	
	public AdminDAO() {
		
		prop = new Properties();
		
		String filePath = AdminDAO.class.getResource("/config/admin-sql.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount(Connection con) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
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

	public ArrayList<Member> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				Member m = new Member();
				
				m.setUserId(rset.getString("M_ID"));
				m.setUserGrade(rset.getString("MG_LEVEL"));
				m.setUserName(rset.getString("M_NAME"));
				m.setEnrollDate(rset.getDate("M_ENROLLDATE"));
				m.setUserStatus(rset.getString("M_STATUS"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateGrade(Connection con, String userId, int userGrade) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateGrade");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, userGrade);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateStatus(Connection con, String userId, String userStatus) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateStatus");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userStatus);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Member> searchList(Connection con, String condition, String keyword) {

		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(condition) {
		case "u_name" :		// 회원 이름으로 검색 시
			sql = prop.getProperty("searchUname");
			break;
		case "u_id" :		// 회원 아이디로 검색 시
			sql = prop.getProperty("searchUid");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setUserId(rset.getString("M_ID"));
				m.setUserGrade(rset.getString("MG_LEVEL"));
				m.setUserName(rset.getString("M_NAME"));
				m.setEnrollDate(rset.getDate("M_ENROLLDATE"));
				m.setUserStatus(rset.getString("M_STATUS"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Member> searchAll(Connection con, String keyword) {

		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql =  prop.getProperty("searchAll");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = new Member();
				
				m.setUserId(rset.getString("M_ID"));
				m.setUserGrade(rset.getString("MG_LEVEL"));
				m.setUserName(rset.getString("M_NAME"));
				m.setEnrollDate(rset.getDate("M_ENROLLDATE"));
				m.setUserStatus(rset.getString("M_STATUS"));
				
				list.add(m);
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








