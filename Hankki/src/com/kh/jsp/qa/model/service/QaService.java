package com.kh.jsp.qa.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.common.exception.QaException;
import com.kh.jsp.qa.model.dao.QaDAO;
import com.kh.jsp.qa.model.vo.Qa;

import static com.kh.jsp.common.JDBCTemplate.*;

public class QaService {
	

	private Connection con;
	private QaDAO qaDAO = new QaDAO();
	
	public ArrayList<Qa> selectList() throws QaException {
		
		con = getConnection();
		
		ArrayList<Qa> list2 = qaDAO.selectList(con);
		
		close(con);
		
		return list2;		
	}

	
	public int insertQa(Qa q) throws QaException {
		
		con = getConnection();
		
		int result = qaDAO.insertQa(con, q);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public Qa selectOne(int qa_no) throws QaException {
		con = getConnection();
		
		Qa q = qaDAO.selectOne(con, qa_no);
		
		if(q != null) {
			int result = qaDAO.updateReadCount(con, qa_no);
			
			if(result > 0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return q;
	}

	
	public Qa updateView(int qa_no) throws QaException {
		
		con = getConnection();
		
		Qa q = qaDAO.selectOne(con, qa_no);
		
		close(con);

		return q;
	}

	
	public int updateQa(Qa q) throws QaException {
		
		con = getConnection();
		
		int result = qaDAO.updateQa(con, q);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteQa (int qa_no) throws QaException {
		
		con = getConnection();
		
		int result = qaDAO.deleteQa(con, qa_no);
		
		if( result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
    
	
	public ArrayList<Qa> searchQa(String condition, String keyword) throws QaException {
		
		con = getConnection();
		
		ArrayList<Qa> list = null;

		if ( condition.length() > 0 ) {
			
			   list = qaDAO.searchList(con, condition, keyword); 
			   
			   
		} else {
			list = qaDAO.searchAll(con, keyword);
		}

		close(con);
		
		return list;
	}
}
