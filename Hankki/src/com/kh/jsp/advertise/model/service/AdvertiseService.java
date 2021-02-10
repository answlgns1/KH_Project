package com.kh.jsp.advertise.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.advertise.model.dao.AdvertiseDAO;
import com.kh.jsp.advertise.model.vo.Advertisement;
import com.kh.jsp.member.model.vo.Member;

import static com.kh.jsp.common.JDBCTemplate.*;

public class AdvertiseService {

	private Connection con;
	private AdvertiseDAO adDAO = new AdvertiseDAO();
	
	public int insertAdvertise(Advertisement ad) {
		con = getConnection();
		
		int result = adDAO.insertAdvertise(con, ad);
		
		if( result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Advertisement> selectList() {
		con = getConnection();
		
		ArrayList<Advertisement> list = adDAO.selectList(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<Advertisement> searchMember(String condition, String keyword) {
		con = getConnection();
		
		ArrayList<Advertisement> list = null;
		
		// 검색 옵션에 광고 번호, 광고 이름 등 그 어떤 것이라도
		// 조건을 달았다면 조건부 검색을 실시
		if( condition.length() > 0 ) {
			
			list = adDAO.searchList(con, condition, keyword);
			
		} else {
			// 검색 옵션을 선택하지 않았다면 전체 검색
			list = adDAO.searchAll(con, keyword);
		}
		
		close(con);
		
		return list;
	}
}

















