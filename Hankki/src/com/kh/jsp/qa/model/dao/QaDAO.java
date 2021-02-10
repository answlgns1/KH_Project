package com.kh.jsp.qa.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jsp.common.exception.QaException;
import com.kh.jsp.qa.model.vo.Qa;

import static com.kh.jsp.common.JDBCTemplate.*;


  public class QaDAO {

     private Properties prop;
		
	 public QaDAO() {
		 prop = new Properties();
		 String filePath = QaDAO.class
                 .getResource("/config/qa-sql.properties")
                 .getPath();

         try {
         prop.load(new FileReader(filePath));
         
         } catch (FileNotFoundException e) {
         e.printStackTrace();
         
         } catch (IOException e) {			
         e.printStackTrace();
         }
    }

	public ArrayList<Qa> selectList(Connection con) throws QaException {
		
		ArrayList<Qa> list2 = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
            rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				Qa q = new Qa();
				
				q.setQa_no( rset.getInt(1)  );
				q.setQa_writer( rset.getString(2)  );
				q.setQa_title( rset.getString(3)  );
				q.setQa_content( rset.getString(4)  );
				q.setQa_date( rset.getDate(5)  );
				
				list2.add(q);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new QaException("[DAO] : " + e.getMessage());
			
		} finally {
			
			 close(rset);
			 close(pstmt);
		}
		
		return list2;
	}

	public int insertQa(Connection con, Qa q) throws QaException {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQa");
		

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, q.getQa_no());
			pstmt.setString(2, q.getQa_title());			
			pstmt.setString(3, q.getQa_writer());
			pstmt.setDate(4, q.getQa_date());
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new QaException("[DAO] : " + e.getMessage());
		}
		return result;
	}

	public Qa selectOne(Connection con, int qa_no) throws QaException {
		
		Qa result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qa_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Qa();
				
				result.setQa_no(qa_no);
				result.setQa_title(rset.getString("qa_title"));
				result.setQa_content(rset.getString("qa_content"));
				result.setQa_writer(rset.getString("qa_writer"));
				result.setQa_date(rset.getDate("qa_date"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new QaException("[DAO] : " + e.getMessage());
		
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int updateReadCount(Connection con, int qa_no) throws QaException {
		
		int result = 0; 
    	PreparedStatement pstmt = null;
    	
    	String sql = prop.getProperty("updateReadCount");
    	
    	try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qa_no);
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			
			e.printStackTrace();	
			throw new QaException("[DAO] : e.getMessage");
		
		} finally {
			close(pstmt);
		}
    	
    	return result;
	}

	public int updateQa(Connection con, Qa q) throws QaException {
		
		int result = 0;
     	PreparedStatement pstmt = null; 
		
		String sql = prop.getProperty("updateQa");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, q.getQa_title());
			pstmt.setString(2, q.getQa_content());
			pstmt.setDate(3, q.getQa_date());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new QaException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int deleteQa(Connection con, int qa_no) throws QaException {
		
		int result = 0;
		PreparedStatement pstmt = null; 
		
		String sql = prop.getProperty("deleteQa");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qa_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			throw new QaException("[DAO] : " + e.getMessage());	
		} finally {
			
			close(pstmt);
			
		}
			
		return result;
	}

	public ArrayList<Qa> searchList(Connection con, String condition, String keyword) throws QaException {
		
		ArrayList<Qa> list2 = new ArrayList<>();
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null;
	        
		String sql = null;
		
		switch(condition) {
		case "number" : // 번호로 검색 시 
			sql = prop.getProperty("searchNo");
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
				Qa q = new Qa();
				
				q.setQa_no( rset.getInt(1)  );
				q.setQa_writer( rset.getString(2)  );
				q.setQa_title( rset.getString(3)  );
				q.setQa_content( rset.getString(4)  );
				q.setQa_date( rset.getDate(5)  );
				
				list2.add(q);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new QaException("[DAO] : " + e.getMessage());
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return list2;
	}

	public ArrayList<Qa> searchAll(Connection con, String keyword) throws QaException {
		
		ArrayList<Qa> list2 = new ArrayList<>();
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
				Qa q = new Qa();
				
				q.setQa_no( rset.getInt(1)  );
				q.setQa_writer( rset.getString(2)  );
				q.setQa_title( rset.getString(3)  );
				q.setQa_content( rset.getString(4)  );
				q.setQa_date( rset.getDate(5)  );
				
				list2.add(q);
				
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			throw new QaException("[DAO] : " + e.getMessage());			
		} finally {
			
			close(rset);
			close(pstmt);
		}

		return list2;
	}

	
  }
