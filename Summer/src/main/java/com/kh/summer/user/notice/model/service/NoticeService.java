package com.kh.summer.user.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.board.model.vo.Board;

public interface NoticeService {

	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);
	
	int selectNoticeTotalContents();
	
	Board selectOneNotice(int bNo);
}
