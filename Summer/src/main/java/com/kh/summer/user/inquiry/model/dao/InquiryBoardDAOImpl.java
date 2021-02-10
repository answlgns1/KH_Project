package com.kh.summer.user.inquiry.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.admin.customerService.model.vo.Question;

@Repository
public class InquiryBoardDAOImpl implements InquiryBoardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectInquiryBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("questionMapper.selectInquiryBoardList", null, rows);
	}

	@Override
	public int selectInquiryBoardTotalContents() {
		
		return sqlSession.selectOne("questionMapper.selectInquiryBoardTotalContents");
	}

	@Override
	public Question selectOneInquiryBoard(int qNo) {

		return sqlSession.selectOne("questionMapper.selectOneInquiryBoard", qNo);
	}

	@Override
	public int insertInquiryBoard(Question question) {
		
		return sqlSession.insert("questionMapper.insertInquiryBoard", question);
	}

	@Override
	public int deleteInquiryBoard(int qNo) {
		
		return sqlSession.delete("questionMapper.deleteInquiryBoard", qNo);
	}

	@Override
	public List<Map<String, String>> selectInquiryBoardSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage); // 페이지 시작 만들어 놓고 거기서 부터 뒤의 갯수
		System.out.println(searchMap);
		return sqlSession.selectList("questionMapper.selectInquiryBoardSearch", searchMap, rows); // 세번째는 RowBounds 자리
	}

	@Override
	public int selectInquiryBoardSearchCount(Map<String, String> searchMap) {
		
		return sqlSession.selectOne("questionMapper.selectInquiryBoardSearchCount", searchMap);
	}
}
