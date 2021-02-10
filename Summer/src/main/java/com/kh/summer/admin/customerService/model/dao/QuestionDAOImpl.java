package com.kh.summer.admin.customerService.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.admin.customerService.model.vo.Question;

@Repository
public class QuestionDAOImpl implements QuestionDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectQuestionList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("questionMapper.selectQuestionList", null, rows);
	}

	@Override
	public int selectQuestionTotalContents() {
		
		return sqlSession.selectOne("questionMapper.selectQuestionTotalContents");
	}

	@Override
	public Question selectOneQuestion(int qNo) {
		 	
		return sqlSession.selectOne("questionMapper.selectOneQuestion", qNo);
	}

	@Override
	public int replyQuestion(int qno, String content) {
		
		Question q = new Question();
		
		q.setQno(qno);
		q.setAcontents(content);
		
		return sqlSession.update("questionMapper.updateReply", q);
	}

	@Override
	public int answerList(String acontents) {
	
		return sqlSession.selectOne("questionMapper.answerList", acontents);
	}

	@Override
	public int answerDelete(int qno) {

		return sqlSession.update("questionMapper.answerDelete", qno);
	}
	


}
