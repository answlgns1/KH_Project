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
public class FreeDAOImpl implements FreeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage); // 페이지 시작 만들어 놓고 거기서 부터 뒤의 갯수
		return sqlSession.selectList("freeMapper.selectFreeList", null, rows); // 세번째는 RowBounds 자리
	}

	@Override
	public int selectBoardTotalContents() {
		return sqlSession.selectOne("freeMapper.selectFreeTotalContents");
	}

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("freeMapper.insertFree", board);
	}

	@Override
	public int insertAttachment(Attachment a) {
		return sqlSession.insert("freeMapper.insertAttachment", a);
	}

	@Override
	public Map<String, String> selectOneBoard(int bNo) {
		return sqlSession.selectOne("freeMapper.selectOneFree", bNo);
	}

	@Override
	public List<Map<String, String>> selectAttachmentList(int bNo) {
		return sqlSession.selectList("freeMapper.selectAttachmentList", bNo);
	}
	
	@Override
	public List<Map<String, String>> selectBoardCommentList(int bNo) {
		return sqlSession.selectList("freeMapper.selectBoardCommentList", bNo);
	}
	
	@Override
	public int updateViews(int bNo) {
		return sqlSession.update("freeMapper.updateViews", bNo);
	}

	@Override
	public int updateBoard(Map<String, String> board) {
		return sqlSession.update("freeMapper.updateFree", board);
	}

	@Override
	public int updateAttachment(Map<String, String> a) {
		System.out.println(a);
		return sqlSession.insert("freeMapper.updateAttachment", a);
	}

	@Override
	public int deleteBoard(int bNo) {
		return sqlSession.delete("freeMapper.deleteFree", bNo);
	}

	@Override
	public int deleteAttachment(int bNo) {
		return sqlSession.delete("freeMapper.deleteAttachment", bNo);
	}

	@Override
	public int deleteFile(int aNo) {
		return sqlSession.delete("freeMapper.deleteFile", aNo);
	}

	@Override
	public int insertComment(Map<String, String> comment) {
		return sqlSession.insert("freeMapper.insertComment", comment);
	}

	@Override
	public int deleteComment(int bcNo) {
		return sqlSession.delete("freeMapper.deleteComment", bcNo);
	}

}
