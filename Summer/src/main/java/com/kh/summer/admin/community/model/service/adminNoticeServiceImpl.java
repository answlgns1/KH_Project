package com.kh.summer.admin.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.admin.community.model.dao.adminNoticeDAO;
import com.kh.summer.common.exception.BoardException;
import com.kh.summer.user.board.model.vo.Board;

@Service
public class adminNoticeServiceImpl implements adminNoticeService {

	@Autowired
	adminNoticeDAO adminNoticeDAO;
	
	@Override
	public List<Map<String, String>> selectAdminNoticeList(int cPage, int numPerPage) {

		return adminNoticeDAO.selectAdminNoticeList(cPage, numPerPage);
	}

	@Override
	public int selectAdminNoticeTotalContents() {
		
		return adminNoticeDAO.selectAdminNoticeTotalContents();
	}

	@Override
	public Board selectOneAdminNotice(int bNo) {

		return adminNoticeDAO.selectOneAdminNotice(bNo);
	}

	@Override
	public int insertAdminNotice(Board board) {
		
		int result1 = adminNoticeDAO.insertAdminNotice(board);
		
		if( result1 == 0 ) throw new BoardException();
		
		return result1;
	}

	@Override
	public int adminNoticeDelete(int bno) {
		
		return adminNoticeDAO.adminNoticeDelete(bno);
	}

}
