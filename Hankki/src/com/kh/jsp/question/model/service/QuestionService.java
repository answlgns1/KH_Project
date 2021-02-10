package com.kh.jsp.question.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.common.exception.QuestionException;
import com.kh.jsp.question.model.dao.QuestionDAO;
import com.kh.jsp.question.model.vo.Question;

import static com.kh.jsp.common.JDBCTemplate.*;

public class QuestionService {

	private Connection con;
	private QuestionDAO qDAO = new QuestionDAO();
	
	public ArrayList<Question> selectList() throws QuestionException {
		
		con = getConnection();
		
		ArrayList<Question> list3 = qDAO.selectList(con);
		
		close(con);
		
		return list3;
	}
	
	public int insertQuestion(Question qu) throws QuestionException {		
		con = getConnection();
		
		int result = qDAO.insertQuestion(con, qu);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	
	public Question selectOne(int q_no) throws QuestionException {
		
		con = getConnection();
		
		Question qu = qDAO.selectOne(con, q_no);
		
		if(qu != null) {
			int result = qDAO.updateReadCount(con, q_no);
			
			if(result > 0) commit(con);
			else rollback(con);
		}
		close(con);

		return qu;		
	}
	
	public Question updateView(int q_no) throws QuestionException {
		
		con = getConnection();
		
		Question qu = qDAO.selectOne(con, q_no);
		
		close(con);
			
		return qu;
	}
	
	public int updateQuestion(Question qu) throws QuestionException {
		
		con = getConnection();
		
		int result = qDAO.updateQuestion(con, qu);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;	
	}
	
	public int deleteQuestion (int q_no) throws QuestionException {
		
		con = getConnection();
		int result = qDAO.deleteQuestion(con, q_no);
		
		if( result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	public ArrayList<Question> searchQuestion(String condition, String keyword) throws QuestionException {
		
        con = getConnection();
		
		ArrayList<Question> list3 = null;
		
		if( condition.length() > 0) {
		list3 = qDAO.searchList(con, condition, keyword);
		
		} else {
			list3 = qDAO.searchAll(con, keyword);
		}
		 close(con);
		 
		return list3;
	}
	
}

