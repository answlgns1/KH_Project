package com.kh.jsp.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.admin.model.dao.AdminDAO;
import com.kh.jsp.member.model.vo.Member;

import static com.kh.jsp.common.JDBCTemplate.*;

public class AdminService {

	private Connection con;
	private AdminDAO aDAO = new AdminDAO();
	
	public ArrayList<Member> selectList(int currentPage, int limit) {
		
		con = getConnection();
		
		ArrayList<Member> list = aDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int updateGrade(String userId, int userGrade) {
		
		con = getConnection();
		int result = 0;
		
		result = aDAO.updateGrade(con, userId, userGrade);
		
		close(con);
		
		return result;
	}

	public int updateStatus(String userId, String userStatus) {
		
		con = getConnection();
		int result = 0;
		
		result = aDAO.updateStatus(con, userId, userStatus);
		
		close(con);
		
		return result;
	}

	public ArrayList<Member> searchMember(String condition, String keyword) {
		con = getConnection();
		
		ArrayList<Member> list = null;
		
		// 검색 옵션에 회원 이름, 회원 아이디 등 그 어떤 것이라도
		// 조건을 달았다면 조건부 검색을 실시
		if( condition.length() > 0 ) {
			
			list = aDAO.searchList(con, condition, keyword);
			
		} else {
			// 검색 옵션을 선택하지 않았다면 전체 검색
			list = aDAO.searchAll(con, keyword);
		}
		
		close(con);
		
		return list;
	}

	public int getListCount() {
		con = getConnection();
		
		int result = aDAO.getListCount(con);
		
		close(con);
		
		return result;
	}




}









