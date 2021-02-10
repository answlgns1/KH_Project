package com.kh.summer.user.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;

@Repository
public class TradeDAOImpl implements TradeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectTradeList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage); // 페이지 시작 만들어 놓고 거기서 부터 뒤의 갯수
		return sqlSession.selectList("tradeMapper.selectTradeList", null, rows); // 세번째는 RowBounds 자리
	}

	@Override
	public int selectTradeTotalContents() {
		return sqlSession.selectOne("tradeMapper.selectTradeTotalContents");
	}

	@Override
	public Map<String, String> selectOneTrade(int no) {
		return sqlSession.selectOne("tradeMapper.selectOneTrade", no);
	}

	@Override
	public int updateViews(int no) {
		return sqlSession.update("tradeMapper.updateViews", no);
	}

	@Override
	public List<Map<String, String>> selectAttachmentList(int no) {
		return sqlSession.selectList("tradeMapper.selectAttachmentList", no);
	}

	@Override
	public List<Map<String, String>> selectTradeCommentList(int no) {
		return sqlSession.selectList("tradeMapper.selectTradeCommentList", no);
	}

	@Override
	public int insertTrade(Board board) {
		return sqlSession.insert("tradeMapper.insertTrade", board);
	}

	@Override
	public int insertAttachment(Attachment a) {
		return sqlSession.insert("tradeMapper.insertAttachment", a);
	}
}
