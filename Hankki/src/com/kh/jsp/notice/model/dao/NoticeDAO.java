package com.kh.jsp.notice.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.jsp.common.JDBCTemplate.*;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.notice.model.vo.Notice;

    public class NoticeDAO {
	
	 private Properties prop;
	
	 public NoticeDAO() {
		
		prop = new Properties();
		
		String filePath = NoticeDAO.class
				                   .getResource("/config/notice-sql.properties")
				                   .getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	public ArrayList<Notice> selectList(Connection con) throws NoticeException {
		
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				Notice n = new Notice();
				
				n.setN_no( rset.getInt(1)  );
				n.setN_writer( rset.getString(2)  );
				n.setN_title( rset.getString(3)  );
				n.setN_content( rset.getString(4)  );
				n.setN_date( rset.getDate(5)  );
				n.setN_count( rset.getInt(6)  );
				n.setN_attachment( rset.getString(7)  );
				
				list.add(n);
			}
			
        } catch (SQLException e) {
			
			e.printStackTrace();
			throw new NoticeException("[DAO] : " + e.getMessage());
			
		} finally {
			 close(rset);
			 close(pstmt);
			
		}
		return list;
		
	}

	public int insertNotice(Connection con, Notice n) throws NoticeException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, n.getN_title());
			pstmt.setString(2, n.getN_content());
			//pstmt.setString(3, n.getN_writer());
			pstmt.setDate(3, n.getN_date());
			
		} catch (SQLException e) {			
			e.printStackTrace();
			throw new NoticeException("[DAO] : " + e.getMessage());

		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
    public Notice selectOne(Connection con, int n_no) throws NoticeException {
		
		Notice result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, n_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Notice();
				
				result.setN_no(n_no);
				result.setN_title(rset.getString("n_title"));
				result.setN_content(rset.getString("n_content"));
				result.setN_writer(rset.getString("a_id"));
				result.setN_count(rset.getInt("n_count"));
				result.setN_date(rset.getDate("n_date"));
				result.setN_attachment(rset.getString("n_attachment"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new NoticeException("[DAO] : " + e.getMessage());
			
		} finally {
			  close(rset);
			  close(pstmt);
		}
		
		return result;
	}

    public int updateReadCount(Connection con, int n_no) throws NoticeException {
    	
    	int result = 0; 
    	PreparedStatement pstmt = null;
    	
    	String sql = prop.getProperty("updateReadCount");
    	
    	try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, n_no);
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			throw new NoticeException("[DAO] : e.getMessage");
		
		} finally {
			close(pstmt);
		}
    	
    	return result;
    }
    
    public int updateNotice(Connection con, Notice n) throws NoticeException {
		
		int result = 0;
     	PreparedStatement pstmt = null; 
		
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, n.getN_no());
			pstmt.setString(2, n.getN_title());
			pstmt.setString(3, n.getN_content());
		
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new NoticeException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteNotice(Connection con, int n_no) throws NoticeException {
		
		int result = 0;
		PreparedStatement pstmt = null; 
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, n_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			throw new NoticeException("[DAO] : " + e.getMessage());	
		} finally {
			
			close(pstmt);
			
		}
			
		return result;
	}

	public ArrayList<Notice> searchList(Connection con, String condition, String keyword) throws NoticeException {
		
		ArrayList<Notice> list = new ArrayList<>();
        PreparedStatement pstmt = null; 
		ResultSet rset = null;
        
		String sql = null;
		
		switch(condition) {
		case "writer" : // 작성자로 검색 시 
			sql = prop.getProperty("searchWriter");
			break;
		case "title" :  // 제목으로 검색 시 
			sql = prop.getProperty("searchTitle");
			break;
		case "content" : // 내용으로 검색 시 
			sql = prop.getProperty("searchContent");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setN_no( rset.getInt(1)  );
				n.setN_writer( rset.getString(2)  );
				n.setN_title( rset.getString(3)  );
				n.setN_content( rset.getString(4)  );
				n.setN_date( rset.getDate(5)  );
				n.setN_count( rset.getInt(6)  );
				n.setN_attachment( rset.getString(7)  );
				
				list.add(n);
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			throw new NoticeException("[DAO] : " + e.getMessage());			
		} finally {
			
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Notice> searchAll(Connection con, String keyword) throws NoticeException {
		
		ArrayList<Notice> list = new ArrayList<>();
        PreparedStatement pstmt = null; 
		ResultSet rset = null;
        
		String sql = prop.getProperty("searchAll");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setN_no( rset.getInt(1)  );
				n.setN_writer( rset.getString(2)  );
				n.setN_title( rset.getString(3)  );
				n.setN_content( rset.getString(4)  );
				n.setN_date( rset.getDate(5)  );
				n.setN_count( rset.getInt(6)  );
				n.setN_attachment( rset.getString(7)  );
				
				list.add(n);
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			throw new NoticeException("[DAO] : " + e.getMessage());			
		} finally {
			
			close(rset);
			close(pstmt);
		}

		return list;
	}
}
