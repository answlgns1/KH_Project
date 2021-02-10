package com.kh.summer.user.inquiry.model.dao;

import java.util.List;
import java.util.Map;
import com.kh.summer.admin.customerService.model.vo.Question;

public interface InquiryBoardDAO {
	
	List<Map<String, String>> selectInquiryBoardList(int cPage, int numPerPage);
	
	int selectInquiryBoardTotalContents();
	
	Question selectOneInquiryBoard(int qNo);
	
	int insertInquiryBoard(Question question);
	
	int deleteInquiryBoard(int qNo);

	List<Map<String, String>> selectInquiryBoardSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectInquiryBoardSearchCount(Map<String, String> searchMap);
}
