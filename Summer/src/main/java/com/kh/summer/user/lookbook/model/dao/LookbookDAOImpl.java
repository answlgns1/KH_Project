package com.kh.summer.user.lookbook.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;

@Repository
public class LookbookDAOImpl implements LookbookDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectLookbookList(int cPage, int numPerPage, String sort) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage); // 페이지 시작 만들어 놓고 거기서 부터 뒤의 갯수
		return sqlSession.selectList("lookbookMapper.selectLookbookList", sort, rows); // 세번째는 RowBounds 자리
	}
	
	@Override
	public List<Map<String, String>> selectLookbookSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage); // 페이지 시작 만들어 놓고 거기서 부터 뒤의 갯수
		System.out.println(searchMap);
		return sqlSession.selectList("lookbookMapper.selectLookbookSearch", searchMap, rows); // 세번째는 RowBounds 자리
	}

	@Override
	public int selectLookbookTotalContents() {
		return sqlSession.selectOne("lookbookMapper.selectLookbookTotalContents");
	}
	
	@Override
	public int selectLookbookSearchCount(Map<String, String> searchMap) {
		return sqlSession.selectOne("lookbookMapper.selectLookbookSearchCount", searchMap);
	}
	
	@Override
	public Map<String, String> selectLookbookDetail(int bno) {
		return sqlSession.selectOne("lookbookMapper.selectLookbookDetail", bno);
	}
	
	@Override
	public List<Map<String, String>> selectLookbookCommentList(int bno) {
		return sqlSession.selectList("lookbookMapper.selectLookbookCommentList", bno);
	}
	
	@Override
	public int insertLookbookComment(Map<String, String> comment) {
		return sqlSession.insert("lookbookMapper.insertLookbookComment", comment);
	}
	
	@Override
	public int updateLookbookComment(Map<String, String> uc) {
		return sqlSession.update("lookbookMapper.updateLookbookComment", uc);
	}
	
	@Override
	public int deleteLookbookComment(int bcNo) {
		return sqlSession.update("lookbookMapper.deleteLookbookComment", bcNo);
	}

	@Override
	public int insertLookbook(Board board) {
		return sqlSession.insert("lookbookMapper.insertLookbook", board);
	}

	@Override
	public int insertAttachment(Attachment a) {
		return sqlSession.insert("lookbookMapper.insertAttachment", a);
	}

	@Override
	public Board selectOneLookbook(int bNo) {
		return sqlSession.selectOne("lookbookMapper.selectOneLookbook", bNo);
	}

	@Override
	public List<Map<String, String>> selectAttachmentList(int bno) {
		return sqlSession.selectList("lookbookMapper.selectAttachmentList", bno);
	}

	@Override
	public int updateReadCount(int bNo) {
		return sqlSession.update("lookbookMapper.updateReadCount", bNo);
	}

	@Override
	public int updateLookbook(Board board) {
		return sqlSession.update("lookbookMapper.updateLookbook", board);
	}

	@Override
	public int updateAttachment(Attachment a) {
		return sqlSession.insert("lookbookMapper.updateAttachment", a);
	}

	@Override
	public int deleteLookbook(int bno) {
		return sqlSession.update("lookbookMapper.deleteLookbook", bno);
	}

	@Override
	public int deleteAttachment(int bNo) {
		return sqlSession.delete("lookbookMapper.deleteAttachment", bNo);
	}

	@Override
	public int deleteFile(int aNo) {
		return sqlSession.delete("lookbookMapper.deleteFile", aNo);
	}

	@Override
	public int viewUp(int bno) {
		return sqlSession.update("lookbookMapper.lookbookViewUp", bno);
	}

	@Override
	public List<Attachment> AttachmentList(int bno) {
		return sqlSession.selectList("lookbookMapper.AttachmentList", bno);
	}
	

}
