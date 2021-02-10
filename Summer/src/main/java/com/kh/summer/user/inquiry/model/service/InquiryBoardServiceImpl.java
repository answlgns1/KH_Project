package com.kh.summer.user.inquiry.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.common.exception.BoardException;
import com.kh.summer.user.inquiry.model.dao.InquiryBoardDAO;
import com.kh.summer.admin.customerService.model.vo.Question;

@Service
public class InquiryBoardServiceImpl implements InquiryBoardService {

	@Autowired
	InquiryBoardDAO inquiryBoardDAO;
	
	@Override
	public List<Map<String, String>> selectInquiryBoardList(int cPage, int numPerPage) {
		
		return inquiryBoardDAO.selectInquiryBoardList(cPage, numPerPage);
	}

	@Override
	public int selectInquiryBoardTotalContents() {
		
		return inquiryBoardDAO.selectInquiryBoardTotalContents();
	}

	@Override
	public Question selectOneInquiryBoard(int qNo) {
		
		return inquiryBoardDAO.selectOneInquiryBoard(qNo);
	}

	// 문의글 작성
	@Override
	public int insertInquiryBoard(Question question) {
		
		int result1 = inquiryBoardDAO.insertInquiryBoard(question);
		
		if( result1 == 0 ) throw new BoardException();
		
		return result1;
	}

	@Override
	public int deleteInquiryBoard(int qNo) {

		return inquiryBoardDAO.deleteInquiryBoard(qNo);
	}

	@Override
	public List<Map<String, String>> selectInquiryBoardSearch(int cPage, int numPerPage,
			Map<String, String> searchMap) {

		return inquiryBoardDAO.selectInquiryBoardSearch(cPage, numPerPage, searchMap);
	}
	
	@Override
	public int selectInquiryBoardSearchCount(Map<String, String> searchMap) {
		return inquiryBoardDAO.selectInquiryBoardSearchCount(searchMap);
	}
}
