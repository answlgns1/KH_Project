package com.kh.summer.user.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.user.board.model.vo.Board;
import com.kh.summer.user.notice.model.dao.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		
		return noticeDAO.selectNoticeList(cPage, numPerPage);
	}

	@Override
	public int selectNoticeTotalContents() {
	
		return noticeDAO.selectNoticeTotalContents();
	}

	@Override
	public Board selectOneNotice(int bNo) {
		
		return noticeDAO.selectOneNotice(bNo);
	}

}
