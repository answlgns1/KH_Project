package com.kh.summer.admin.customerService.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.summer.admin.customerService.model.vo.Question;

public interface QuestionDAO {

	List<Map<String, String>> selectQuestionList(int cPage, int numPerPage);
	
	int selectQuestionTotalContents();
	
	Question selectOneQuestion(int qNo);
	
	int replyQuestion(int qno, String content);

	int answerList(String acontents);

	int answerDelete(int qno);
	
}
