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
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage); // 페이지 시작 만들어 놓고 거기서 부터 뒤의 갯수
		return sqlSession.selectList("boardMapper.selectBoardList", null, rows); // 세번째는 RowBounds 자리
	}

	@Override
	public int selectBoardTotalContents() {
		return sqlSession.selectOne("boardMapper.selectBoardTotalContents");
	}

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("boardMapper.insertBoard", board);
	}

	@Override
	public int insertAttachment(Attachment a) {
		return sqlSession.insert("boardMapper.insertAttachment", a);
	}

	@Override
	public Board selectOneBoard(int bNo) {
		return sqlSession.selectOne("boardMapper.selectOneBoard", bNo);
	}

	@Override
	public List<Attachment> selectAttachmentList(int bNo) {
		return sqlSession.selectList("boardMapper.selectAttachmentList", bNo);
	}

	@Override
	public int updateReadCount(int bNo) {
		return sqlSession.update("boardMapper.updateReadCount", bNo);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("boardMapper.updateBoard", board);
	}

	@Override
	public int updateAttachment(Attachment a) {
		return sqlSession.insert("boardMapper.updateAttachment", a);
	}

	@Override
	public int deleteBoard(int bNo) {
		return sqlSession.delete("boardMapper.deleteBoard", bNo);
	}

	@Override
	public int deleteAttachment(int bNo) {
		return sqlSession.delete("boardMapper.deleteAttachment", bNo);
	}

	@Override
	public int deleteFile(int attNo) {
		return sqlSession.delete("boardMapper.deleteFile", attNo);
	}

}
