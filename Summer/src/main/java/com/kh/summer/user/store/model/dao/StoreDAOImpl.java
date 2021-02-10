package com.kh.summer.user.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.store.model.dao.StoreDAO;
import com.kh.summer.user.store.model.vo.Store;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectStoreTopList(int cPage, int numPerPage, String sort) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage); // 페이지 시작 만들어 놓고 거기서 부터 뒤의 갯수
		return sqlSession.selectList("storeMapper.selectStoreTopList", sort, rows); // 세번째는 RowBounds 자리
	}

	@Override
	public int selectStoreTopTotalContents() {
		return sqlSession.selectOne("storeMapper.selectStoreTopTotalContents");
	}
	
	@Override
	public List<Map<String, String>> selectStorePantsList(int cPage, int numPerPage, String sort) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage); // 페이지 시작 만들어 놓고 거기서 부터 뒤의 갯수
		return sqlSession.selectList("storeMapper.selectStorePantsList", sort, rows); // 세번째는 RowBounds 자리
	}

	@Override
	public int selectStorePantsTotalContents() {
		return sqlSession.selectOne("storeMapper.selectStorePantsTotalContents");
	}
	
	@Override
	public List<Map<String, String>> selectStoreOuterList(int cPage, int numPerPage, String sort) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage); // 페이지 시작 만들어 놓고 거기서 부터 뒤의 갯수
		return sqlSession.selectList("storeMapper.selectStoreOuterList", sort, rows); // 세번째는 RowBounds 자리
	}

	@Override
	public int selectStoreOuterTotalContents() {
		return sqlSession.selectOne("storeMapper.selectStoreOuterTotalContents");
	}

	@Override
	public int insertStore(Store store) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAttachment(Attachment a) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, String> selectOneStore(int bNo) {
		return sqlSession.selectOne("storeMapper.selectOneStore", bNo);
		
	}

	@Override
	public List<Map<String, String>> selectAttachmentList(int bNo) {
		return sqlSession.selectList("storeMapper.selectAttachmentList", bNo);
	}

	@Override
	public int updateViews(int bNo) {
		return sqlSession.update("storeMapper.updateViews", bNo);
		
	}
	
	@Override
	public int updateLike(Map<String, String> like) {
		return sqlSession.update("storeMapper.updateLike", like);
		
	}

	@Override
	public List<Map<String, String>> selectStoreCommentList(int bNo) {
		return sqlSession.selectList("storeMapper.selectStoreCommentList", bNo);
	}

	@Override
	public List<Map<String, String>> selectSize(int bNo) {
		return sqlSession.selectList("storeMapper.selectSize", bNo);
	}

	@Override
	public int selectSmallSize(Map<String, String> size) {
		return sqlSession.selectOne("storeMapper.selectSmallSize", size);
	}

	@Override
	public int insertStoreComment(Map<String, String> comment) {
		return sqlSession.insert("storeMapper.insertStoreComment", comment);
	}

	@Override
	public int deleteStoreComment(int bcNo) {
		return sqlSession.delete("storeMapper.deleteStoreComment", bcNo);
	}

	@Override
	public List<Map<String, String>> selectStoreMainList() {
		return sqlSession.selectList("storeMapper.selectStoreMainList");
	}

	@Override
	public Map<String, Object> selectSize(String Id) {
		return sqlSession.selectOne("storeMapper.selectMySize", Id);
	}

}
