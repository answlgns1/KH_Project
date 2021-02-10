package com.kh.summer.user.myPage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.pants.model.vo.Pants;
import com.kh.summer.user.top.model.vo.Top;

@Repository
public class myPageDAOImpl implements myPageDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectReviewList(int cPage, int numPerPage, String userId) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypageMapper.selectReviewList", userId, rows);
	}

	@Override
	public int selectReviewTotalContents(String userId) {
		return sqlSession.selectOne("mypageMapper.selectReviewTotalContents", userId);
	}

	@Override
	public List<Map<String, String>> selectLikeList(int cPage, int numPerPage, String userId) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypageMapper.selectLikeList", userId, rows);
	}

	@Override
	public int selectLikeTotalContents(String userId) {
		return sqlSession.selectOne("mypageMapper.selectLikeTotalContents", userId);
	}

	@Override
	public List<Map<String, String>> selectPointList(int cPage, int numPerPage, String userId) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypageMapper.selectPointList", userId, rows);
	}

	@Override
	public int selectPointTotalContents(String userId) {
		return sqlSession.selectOne("mypageMapper.selectPointTotalContents", userId);
	}

	@Override
	public Top selectTopSize(String userId) {
		return sqlSession.selectOne("mypageMapper.selectTopSize", userId);
	}

	@Override
	public Pants selectPantsSize(String userId) {
		return sqlSession.selectOne("mypageMapper.selectPantsSize", userId);
	}

	@Override
	public int insertTopSize(Map<String, String> map) {
		return sqlSession.insert("mypageMapper.insertTopSize", map);
	}

	@Override
	public int insertPantsSize(Map<String, String> map) {
		return sqlSession.insert("mypageMapper.insertPantsSize", map);
	}

	@Override
	public int updateTopSize(Map<String, String> map) {
		return sqlSession.update("mypageMapper.updateTopSize", map);
	}

	@Override
	public int updatePantsSize(Map<String, String> map) {
		return sqlSession.update("mypageMapper.updatePantsSize", map);
	}

	@Override
	public List<Map<String, String>> selectQuestionList(int cPage, int numPerPage, String userId) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("mypageMapper.selectQuestionList", userId, rows);
	}

	@Override
	public int selectQuestionTotalContents(String userId) {
		return sqlSession.selectOne("mypageMapper.selectQuestionTotalContents", userId);
	}

}
