package com.kh.jsp.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.notice.model.dao.NoticeDAO;
import com.kh.jsp.notice.model.vo.Notice;

import static com.kh.jsp.common.JDBCTemplate.*;

public class NoticeService {
	
	private Connection con;
	private NoticeDAO nDAO = new NoticeDAO();
	
	public ArrayList<Notice> selectList() throws NoticeException {
		
		con = getConnection();
		
		ArrayList<Notice> list = nDAO.selectList(con);
		
		close(con);
		
		return list;		
	}
	
	/* 공지사항 입력 */
	public int insertNotice(Notice n) throws NoticeException {
		
		con = getConnection();
		
		int result = nDAO.insertNotice(con, n);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	/* 공지사항 선택*/
	public Notice selectOne(int n_no) throws NoticeException {
		con = getConnection();
		
		Notice n = nDAO.selectOne(con, n_no);
		
		if(n != null) {
			int result = nDAO.updateReadCount(con, n_no);
			
			if(result > 0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return n;
	}

	/*공지사항 수정 화면*/
	public Notice updateView(int n_no) throws NoticeException {
		
		con = getConnection();
		
		Notice n = nDAO.selectOne(con, n_no);
		
		close(con);

		return n;
	}

	/*공지사항 수정*/
	public int updateNotice(Notice n) throws NoticeException {
		
		con = getConnection();
		
		int result = nDAO.updateNotice(con, n);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	/*공지사항 삭제*/
	public int deleteNotice(int n_no) throws NoticeException {
		
		con = getConnection();
		
		int result = nDAO.deleteNotice(con, n_no);
		
		if( result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
    
	/*공지사항 검색*/
	public ArrayList<Notice> searchNotice(String condition, String keyword) throws NoticeException {
		
		con = getConnection();
		
		ArrayList<Notice> list = null;

		if ( condition.length() > 0 ) {
			
			   list = nDAO.searchList(con, condition, keyword); 
			   
			   
		} else {
			list = nDAO.searchAll(con, keyword);
		}

		close(con);
		
		return list;
	}
}


