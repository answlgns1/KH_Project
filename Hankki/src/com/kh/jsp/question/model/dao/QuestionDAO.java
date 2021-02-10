package com.kh.jsp.question.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jsp.common.exception.QuestionException;
import com.kh.jsp.question.model.vo.Question;

import static com.kh.jsp.common.JDBCTemplate.*;

public class QuestionDAO {
	
	private Properties prop;
	
	public QuestionDAO() {
		prop = new Properties();
		String filePath = QuestionDAO.class
				          .getResource("/config/question-sql.properties")
				          .getPath();
		
		try {
			prop.load( new FileReader(filePath));
			
		} catch (FileNotFoundException e) {		
			e.printStackTrace();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Question> selectList(Connection con) throws QuestionException {
		
		ArrayList<Question> list3 = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
		    rset = pstmt.executeQuery();
				
		    while (rset.next()) { 
		    	 
		    	Question qu = new Question();
		    	
		    	qu.setQ_no(rset.getInt(1));
		    	qu.setQ_writer(rset.getString(2));
		    	qu.setQ_title(rset.getString(3));
		    	qu.setQ_content(rset.getString(4));
		    	qu.setQ_attachment(rset.getString(5));
		    	
		        list3.add(qu);				
		     }
		     
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new QuestionException("[DAO] : " + e.getMessage());
		} finally {
			
	       close(rset);
	       close(pstmt);
		}

		return list3;
	}

	public int insertQuestion(Connection con, Question qu) throws QuestionException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQuestion");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qu.getQ_no());
			pstmt.setString(2, qu.getQ_title());
			pstmt.setString(3, qu.getQ_content());
			pstmt.setString(4, qu.getQ_attachment());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			throw new QuestionException("[DAO] : " + e.getMessage());
		}
		return result;
	}

	public Question selectOne(Connection con, int q_no) throws QuestionException {
		
		Question result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, q_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Question();
				
				result.setQ_no(q_no);
				result.setQ_writer(rset.getString("q_writer"));
				result.setQ_title(rset.getString("q_title"));
				result.setQ_content(rset.getString("q_content"));
				result.setQ_attachment(rset.getString("q_attachment"));				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new QuestionException("[DAO] : " + e.getMessage());
		
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int updateReadCount(Connection con, int q_no) throws QuestionException {
		
		int result = 0; 
    	PreparedStatement pstmt = null;
    	
    	String sql = prop.getProperty("updateReadCount");
		
		try {
			pstmt = con.prepareStatement(sql);
            
			pstmt.setInt(1, q_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();	
			throw new QuestionException("[DAO] : e.getMessage");
		
		} finally {
			close(pstmt);
		}
    	
    	return result;
	}

	public int updateQuestion(Connection con, Question qu) throws QuestionException {

		int result = 0;
     	PreparedStatement pstmt = null; 
		
		String sql = prop.getProperty("updateQuestion");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, qu.getQ_title());
			pstmt.setString(2, qu.getQ_content());
			pstmt.setString(3, qu.getQ_attachment());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new QuestionException("[DAO] : e.getMessage");
		
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int deleteQuestion(Connection con, int q_no) throws QuestionException {
		
		int result = 0;
		PreparedStatement pstmt = null; 
		
		String sql = prop.getProperty("deleteQuestion");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, q_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new QuestionException("[DAO] : e.getMessage");
		
		} finally {
			
			close(pstmt);
		}
			
		return result;	
	}

	public ArrayList<Question> searchList(Connection con, String condition, String keyword) throws QuestionException {
        ArrayList<Question> list3 = new ArrayList<>();
		
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
				Question qu = new Question();
				
				qu.setQ_no( rset.getInt(1)  );
				qu.setQ_writer( rset.getString(2)  );
				qu.setQ_title( rset.getString(3)  );
				qu.setQ_content( rset.getString(4)  );
				qu.setQ_attachment( rset.getString(5)  );
				
				list3.add(qu);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new QuestionException("[DAO] : " + e.getMessage());
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return list3;
	}
	

	public ArrayList<Question> searchAll(Connection con, String keyword) throws QuestionException {
		
		ArrayList<Question> list3 = new ArrayList<>();
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
				Question qu = new Question();
				
				qu.setQ_no( rset.getInt(1)  );
				qu.setQ_writer( rset.getString(2)  );
				qu.setQ_title( rset.getString(3)  );
				qu.setQ_content( rset.getString(4)  );
				qu.setQ_attachment( rset.getString(5)  );
				
				list3.add(qu);
				
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			throw new QuestionException("[DAO] : " + e.getMessage());			
		} finally {
			
			close(rset);
			close(pstmt);
		}

		return list3;
	}
}
