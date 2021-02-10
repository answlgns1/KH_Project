package com.kh.summer.admin.community.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.board.model.vo.Board;

public interface adminNoticeDAO {
	
	List<Map<String, String>> selectAdminNoticeList(int cPage, int numPerPage);
	
	int selectAdminNoticeTotalContents();
	
	Board selectOneAdminNotice(int bNo);
	
	int insertAdminNotice(Board board);
	
	int adminNoticeDelete(int bno);

}
